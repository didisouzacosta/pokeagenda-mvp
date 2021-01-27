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
                    expect(repository.name) == "charmander"
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
    
    func testShouldReturnIfFetchPokemonsSuccess() throws {
        let repository = PokemonRepositorySpy()
        let useCase = FetchPokemonsUseCase(repository)
        
        repository.pagination = Pagination<PaginationResultItem>([
            .init(name: "Charmander"),
            .init(name: "Bulbasour")
        ])
        
        waitUntil { done in
            useCase.execute(page: 1) { response in
                do {
                    let result = try response.get()
                    
                    expect(result.count) == 2
                    expect(result[0].name) == "Charmander"
                    expect(result[1].name) == "Bulbasour"
                    expect(repository.offset) == 0
                    expect(repository.limit) == 20
                } catch {
                    fail(error.localizedDescription)
                }
                
                done()
            }
        }
    }
    
    func testThrowErrorIfFetchPokemonsFails() throws {
        let repository = PokemonRepositorySpy()
        let useCase = FetchPokemonsUseCase(repository)
        
        repository.error = "Simulação de erro"
        
        waitUntil { done in
            useCase.execute(page: 33) { response in
                do {
                    _ = try response.get()
                    
                    fail()
                } catch {
                    expect(error.localizedDescription) == "Simulação de erro"
                }
                
                expect(repository.offset) == 640
                expect(repository.limit) == 20
                
                done()
            }
        }
    }

}
