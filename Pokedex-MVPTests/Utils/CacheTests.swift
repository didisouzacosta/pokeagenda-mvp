//
//  CacheTests.swift
//  Pokedex-MVPTests
//
//  Created by Adriano Souza Costa on 24/01/21.
//

import XCTest
import Nimble

@testable import Pokedex_MVP

class CacheTests: XCTestCase {
    
    func testSetAndRetrieveObjectInCache() throws {
        let cache = Cache()
        let data = "Zelda >> Pokemon"
        
        try cache.set(data, key: "message")
        
        let cachedData = try cache.get(type: String.self, key: "message")
        
        expect(cachedData) == "Zelda >> Pokemon"
    }
    
    func testRemoveCachedObject() throws {
        let cache = Cache()
        let data = ["iOS", "Android"]
        
        try cache.set(data, key: "platforms")
        
        var cachedData = try cache.get(type: [String].self, key: "platforms")
        
        expect(cachedData) == ["iOS", "Android"]
        
        cache.remove(key: "platforms")
        
        cachedData = try cache.get(type: [String].self, key: "platforms")
        
        expect(cachedData).to(beNil())
    }
    
    func testClearCacheData() throws {
        let cache = Cache()
        
        try cache.set(["iOS", "Android"], key: "platforms")
        try cache.set(["React Native", "Flutter"], key: "hibrid")
        try cache.set(["Fullmetal Alchimist", "Dead Note"], key: "best-animes")
        
        cache.clear()
        
        let bestAnimes = try cache.get(type: [String].self, key: "best-animes")
        let hibrid = try cache.get(type: [String].self, key: "hibrid")
        let platforms = try cache.get(type: [String].self, key: "platforms")
        
        expect(bestAnimes).to(beNil())
        expect(hibrid).to(beNil())
        expect(platforms).to(beNil())
    }
    
}
