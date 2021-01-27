//
//  FetchGenerationsUseCaseTests.swift
//  Pokedex-MVPTests
//
//  Created by Adriano Souza Costa on 27/01/21.
//

import XCTest
import Nimble

@testable import Pokedex_MVP

class FetchGenerationsUseCaseTests: XCTestCase {

    func testShouldReturnIfFetchPokemonSuccess() throws {
        let repository = GenerationRepositorySpy()
        let useCase = FetchGenerationsUseCase(repository)
        
        repository.pagination = .init([
            .init(name: "genration-i"),
            .init(name: "genration-ii"),
            .init(name: "genration-iii")
        ])
        
        waitUntil { done in
            useCase.execute() { response in
                do {
                    let result = try response.get()
                    
                    expect(result.count) == 3
                    expect(result[0].name) == "genration-i"
                    expect(result[1].name) == "genration-ii"
                    expect(result[2].name) == "genration-iii"
                } catch {
                    fail(error.localizedDescription)
                }
                
                done()
            }
        }
    }
    
    func testThrowErrorIfFetchPokemonFails() throws {
        let repository = GenerationRepositorySpy()
        let useCase = FetchGenerationsUseCase(repository)
        
        repository.error = "Simulação de erro"
        
        waitUntil { done in
            useCase.execute() { response in
                do {
                    _ = try response.get()
                    
                    fail()
                } catch {
                    expect(error.localizedDescription) == "Simulação de erro"
                }
                
                done()
            }
        }
    }

}
