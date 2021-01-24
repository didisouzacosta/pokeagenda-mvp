//
//  PaginationModelTests.swift
//  Pokedex-MVPTests
//
//  Created by Adriano Souza Costa on 24/01/21.
//

import XCTest
import Nimble

@testable import Pokedex_MVP

class PaginationModelTests: XCTestCase {
    
    func testEnsureDecodeModel() throws {
        let json = """
        {
            "count": 1,
            "next": null,
            "prev": "https://pokeapi.co/api/v2/pokemon?offset=60&limit=20",
            "results": [
                {
                    "name": "generation-ii"
                }
            ]
        }
        """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        let pagination = try decoder.decode(Pagination<GenerationResultItem>.self, from: json)
        
        expect(pagination.count) == 1
        expect(pagination.prev) == URL(string: "https://pokeapi.co/api/v2/pokemon?offset=60&limit=20")
        expect(pagination.next).to(beNil())
        expect(pagination.results[0].name) == "generation-ii"
    }
    
}
