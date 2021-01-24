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
        expect(pagination.results[0].name) == "generation-ii"
    }
    
}
