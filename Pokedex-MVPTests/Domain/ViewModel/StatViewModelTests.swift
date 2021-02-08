//
//  StatViewModelTests.swift
//  Pokedex-MVPTests
//
//  Created by Adriano Souza Costa on 08/02/21.
//

import XCTest
import Nimble

@testable import Pokedex_MVP

class StatViewModelTests: XCTestCase {
    
    func testEnsureStatConsistency() throws {
        let stat = Stat(value: 33.0, name: "hp")
        
        let viewModel = StatViewModel(stat)
        
        expect(viewModel.name) == "HP"
        expect(viewModel.percentage) == 33
        expect(viewModel.valueDescription) == "33"
    }

}
