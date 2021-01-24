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
    
}
