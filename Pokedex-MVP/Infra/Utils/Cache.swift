//
//  Cache.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 24/01/21.
//

import Foundation

protocol CacheProtocol {
    func set<T: Encodable>(_ object: T, key: CacheKey) throws
    func get<T: Decodable>(type: T.Type, key: CacheKey) throws -> T?
    func remove(key: CacheKey)
    func clear()
}

struct CacheKey: RawRepresentable {
    
    // MARK: - Public Variables
    
    public let rawValue: String
    
    // MARK: - Public Methods
    
    public init(rawValue value: String) {
        self.rawValue = value
    }
    
    public init(_ value: String) {
        self.rawValue = value
    }
    
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
    
    func set<T: Encodable>(_ object: T, key: CacheKey) throws {
        let data = try encoder.encode(object)
        cache.setObject(data as AnyObject, forKey: key.rawValue as NSString)
    }
    
    func get<T: Decodable>(type: T.Type, key: CacheKey) throws -> T? {
        guard let data = cache.object(forKey: key.rawValue as NSString) as? Data else {
            return nil
        }
        
        return try decoder.decode(T.self, from: data)
    }
    
    func remove(key: CacheKey) {
        cache.removeObject(forKey: key.rawValue as NSString)
    }
    
    func clear() {
        cache.removeAllObjects()
    }
    
}

