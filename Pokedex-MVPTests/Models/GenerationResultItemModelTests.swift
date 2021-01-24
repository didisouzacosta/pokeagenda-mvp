//
//  GenerationResultItemTests.swift
//  Pokedex-MVPTests
//
//  Created by Adriano Souza Costa on 24/01/21.
//

import XCTest
import Nimble

@testable import Pokedex_MVP

class GenerationResultItemModelTests: XCTestCase {
    
    func testEnsureDecodeModel() throws {
        let json = """
        {
            "name": "generation-i"
        }
        """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        let item = try decoder.decode(PaginationResultItem.self, from: json)
        
        expect(item.name) == "generation-i"
    }
    
}
