//
//  PokemonAPITests.swift
//  Pokedex-MVPTests
//
//  Created by Adriano Souza Costa on 24/01/21.
//

import XCTest
import Nimble

@testable import Pokedex_MVP

class PokemonAPITests: XCTestCase {
    
    func testShouldBeReturnGenerationsIfFetchGenerationsSuccess() {
        let networkSpy = NetworkSpy()
        networkSpy.result = Pagination<PaginationResultItem>(
            [
                .init(name: "generation-i"),
                .init(name: "generation-ii"),
                .init(name: "generation-iii")
            ]
        )
        
        let api = PokemonAPI(network: networkSpy)
        
        waitUntil { done in
            api.fetchGenerations { response in
                do {
                    let results = try response.get().results
                    
                    expect(results.first?.name) == "generation-i"
                    expect(results.last?.name) == "generation-iii"
                    
                    expect(networkSpy.endpoint?.absoluteString) == "https://pokeapi.co/api/v2/generation"
                    expect(networkSpy.method) == .get
                    expect(networkSpy.parameters).to(beNil())
                } catch {
                    fail(error.localizedDescription)
                }
                
                done()
            }
        }
    }
    
    func testThrowErrorIfFetchGenerationsFails() {
        let networkSpy = NetworkSpy()
        networkSpy.error = "Error example"
        
        let api = PokemonAPI(network: networkSpy)
        
        waitUntil { done in
            api.fetchGenerations { response in
                do {
                    _ = try response.get().results
                    fail()
                } catch {
                    expect(error.localizedDescription) == "Error example"
                }
                
                done()
            }
        }
    }
    
    func testShouldBeReturnPokemonIfFetchPokemonSuccess() {
        let networkSpy = NetworkSpy()
        networkSpy.result = Pokemon(
            name: "bulbasaur",
            order: 1,
            weight: 88,
            types: [.init(slot: 1, type: .grass)],
            sprites: .init(other: .init(officialArtwork: .init(frontDefault: URL(string: "https:www.image.com/cover.jpb")!))),
            abilities: [],
            stats: []
        )
        
        let api = PokemonAPI(network: networkSpy)
        
        waitUntil { done in
            api.fetchPokemon("charmander") { response in
                do {
                    let result = try response.get()
                    
                    expect(result.weight) == 88
                    expect(result.types.first?.slot) == 1
                    expect(result.types.first?.type.rawValue) == "grass"
                    
                    expect(networkSpy.endpoint?.absoluteString) == "https://pokeapi.co/api/v2/pokemon/charmander"
                    expect(networkSpy.method) == .get
                    expect(networkSpy.parameters).to(beNil())
                } catch {
                    fail(error.localizedDescription)
                }
                
                done()
            }
        }
    }
    
    func testThrowErrorIfFetchPokemonFails() {
        let networkSpy = NetworkSpy()
        networkSpy.error = "Error example"
        
        let api = PokemonAPI(network: networkSpy)
        
        waitUntil { done in
            api.fetchPokemon("charmander") { response in
                do {
                    _ = try response.get()
                    fail()
                } catch {
                    expect(error.localizedDescription) == "Error example"
                }
                
                done()
            }
        }
    }
    
    func testShouldBeReturnPokemonsIfFetchPokemonsSuccess() {
        let networkSpy = NetworkSpy()
        networkSpy.result = Pagination<PaginationResultItem>(
            [
               .init(name: "charizard")
            ]
        )
        
        let api = PokemonAPI(network: networkSpy)
        
        waitUntil { done in
            api.fetchPokemons(3, limit: 10) { response in
                do {
                    let result = try response.get()
                    
                    expect(result.results.count) == 1
                    expect(result.results.first?.name) == "charizard"
                    
                    expect(networkSpy.endpoint?.absoluteString) == "https://pokeapi.co/api/v2/pokemon"
                    expect(networkSpy.method) == .get
                    expect(networkSpy.parameters?["limit"]).to(be(10))
                    expect(networkSpy.parameters?["offset"]).to(be(3))
                } catch {
                    fail(error.localizedDescription)
                }
                
                done()
            }
        }
    }
    
    func testThrowErrorIfFetchPokemonsFails() {
        let networkSpy = NetworkSpy()
        networkSpy.error = "Error example"
        
        let api = PokemonAPI(network: networkSpy)
        
        waitUntil { done in
            api.fetchPokemons(1, limit: 10) { response in
                do {
                    _ = try response.get()
                    fail()
                } catch {
                    expect(error.localizedDescription) == "Error example"
                }
                
                done()
            }
        }
    }

}
