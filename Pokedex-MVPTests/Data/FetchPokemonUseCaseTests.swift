//
//  FetchPokemonUseCaseTests.swift
//  Pokedex-MVPTests
//
//  Created by Adriano Souza Costa on 27/01/21.
//

import XCTest
import Nimble

@testable import Pokedex_MVP

class FetchPokemonUseCaseTests: XCTestCase {

    func testShouldReturnIfFetchPokemonSuccess() throws {
        let repository = PokemonRepositorySpy()
        let useCase = FetchPokemonUseCase(repository)
        
        repository.pokemon = Pokemon(
            weight: 22,
            types: [
                .init(slot: 1, type: .init(name: "fire"))
            ],
            sprites: .init(
                other: .init(
                    officialArtwork: .init(
                        frontDefault: URL(string: "http://www.img.com")!
                    )
                )
            )
        )
        
        waitUntil { done in
            useCase.execute("charmander") { response in
                do {
                    let result = try response.get()
                    
                    expect(result.types[0].slot) == 1
                    expect(result.types[0].type.name) == "fire"
                } catch {
                    fail(error.localizedDescription)
                }
                
                done()
            }
        }
    }
    
    func testThrowErrorIfFetchPokemonFails() throws {
        let repository = PokemonRepositorySpy()
        let useCase = FetchPokemonUseCase(repository)
        
        repository.error = "Simulação de erro"
        
        waitUntil { done in
            useCase.execute("charmander") { response in
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
