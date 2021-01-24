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
        let cache = MemoryCache()
        let data = "Zelda >> Pokemon"
        let cacheKey = CacheKey("message")
        
        try cache.set(data, key: cacheKey)
        
        let cachedData = try cache.get(type: String.self, key: cacheKey)
        
        expect(cachedData) == "Zelda >> Pokemon"
    }
    
    func testSetAndRetrieveCodableObjectInCache() throws {
        let cache = MemoryCache()
        let cacheKey = CacheKey("generation")
        let generation = GenerationResultItem(name: "generation-iii")
        
        try cache.set(generation, key: cacheKey)
        
        let cachedData = try cache.get(type: GenerationResultItem.self, key: cacheKey)
        
        expect(cachedData?.name) == "generation-iii"
    }
    
    func testRemoveCachedObject() throws {
        let cache = MemoryCache()
        let data = ["iOS", "Android"]
        let cacheKey = CacheKey("platforms")
        
        try cache.set(data, key: cacheKey)
        
        var cachedData = try cache.get(type: [String].self, key: cacheKey)
        
        expect(cachedData) == ["iOS", "Android"]
        
        cache.remove(key: cacheKey)
        
        cachedData = try cache.get(type: [String].self, key: cacheKey)
        
        expect(cachedData).to(beNil())
    }
    
    func testClearCacheData() throws {
        let cache = MemoryCache()
        let platformsKey = CacheKey("platforms")
        let hibridKey = CacheKey("hibrid")
        let bestAnimesKey = CacheKey("best-animes")
        
        try cache.set(["iOS", "Android"], key: platformsKey)
        try cache.set(["React Native", "Flutter"], key: hibridKey)
        try cache.set(["Fullmetal Alchimist", "Dead Note"], key: bestAnimesKey)
        
        cache.clear()
        
        let bestAnimes = try cache.get(type: [String].self, key: platformsKey)
        let hibrid = try cache.get(type: [String].self, key: hibridKey)
        let platforms = try cache.get(type: [String].self, key: bestAnimesKey)
        
        expect(bestAnimes).to(beNil())
        expect(hibrid).to(beNil())
        expect(platforms).to(beNil())
    }
    
}
