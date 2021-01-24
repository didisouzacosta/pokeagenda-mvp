//
//  Cache.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 24/01/21.
//

import Foundation

protocol CacheProtocol {
    func set<T: Encodable>(_ object: T, key: String) throws
    func get<T: Decodable>(type: T.Type, key: String) throws -> T?
    func remove(key: String)
    func clear()
}

final class Cache: CacheProtocol {
    
    // MARK: - Public Properties
    
    static var instance = Cache()
    
    // MARK: - Private Properties
    
    private let cache = NSCache<NSString, AnyObject>()
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    
    // MARK: - Public Methods
    
    init() {
        cache.countLimit = 50
        cache.totalCostLimit = 1024 * 1024 * 20 // 20 MB
    }
    
    func set<T: Encodable>(_ object: T, key: String) throws {
        let data = try encoder.encode(object)
        cache.setObject(data as AnyObject, forKey: key as NSString)
    }
    
    func get<T: Decodable>(type: T.Type, key: String) throws -> T? {
        guard let data = cache.object(forKey: key as NSString) as? Data else {
            return nil
        }
        
        return try decoder.decode(T.self, from: data)
    }
    
    func remove(key: String) {
        cache.removeObject(forKey: key as NSString)
    }
    
    func clear() {
        cache.removeAllObjects()
    }
    
}

