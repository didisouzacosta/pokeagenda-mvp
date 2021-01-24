//
//  CacheSpy.swift
//  Pokedex-MVPTests
//
//  Created by Adriano Souza Costa on 24/01/21.
//

import Foundation
import Pokedex_MVP

final class CacheSpy: CacheProtocol {
    
    var objects: [String: Any] = [:]
    var error: Error?
    
    func set<T>(_ object: T, key: CacheKey) throws where T : Encodable {
        if let error = error { throw error }
        objects[key.rawValue] = object
    }
    
    func get<T>(type: T.Type, key: CacheKey) throws -> T? where T : Decodable {
        if let error = error { throw error }
        return objects[key.rawValue] as? T
    }
    
    func remove(key: CacheKey) {
        objects[key.rawValue] = nil
    }
    
    func clear() {
        objects.removeAll()
    }
    
}
