//
//  PokemonRepositoryTests.swift
//  Pokedex-MVPTests
//
//  Created by Adriano Souza Costa on 24/01/21.
//

import XCTest
import Nimble

@testable import Pokedex_MVP

class PokemonRepositoryTests: XCTestCase {
    
    func testShouldReturnIfFetchPokemonsSuccess() {
        let apiSpy = PokemonAPISpy()
        apiSpy.items = [
            .init(name: "charmander"),
            .init(name: "bulbasour")
        ]
        
        let cacheSpy = CacheSpy()
        let repository = PokemonRepository(apiSpy, cache: cacheSpy)
        
        waitUntil { done in
            repository.fetchPokemons(20, limit: 10) { response in
                do {
                    let result = try response.get()
                    
                    expect(result.count) == 2
                    expect(result.results.first?.name) == "charmander"
                    expect(result.results.last?.name) == "bulbasour"
                    expect(apiSpy.offset) == 20
                    expect(apiSpy.limit) == 10
                    
                    let cache = try cacheSpy.get(
                        type: Pagination<PaginationResultItem>.self,
                        key: CacheKey("20/10")
                    )
                    
                    expect(cache?.count) == 2
                    expect(cache?.results.first?.name) == "charmander"
                    expect(cache?.results.last?.name) == "bulbasour"
                } catch {
                    fail(error.localizedDescription)
                }
                
                done()
            }
        }
        
    }
    
    func testShouldReturnPokemonsDataFromCacheData() throws {
        let apiSpy = PokemonAPISpy()
        let cacheSpy = CacheSpy()
        let repository = PokemonRepository(apiSpy, cache: cacheSpy)
        
        try cacheSpy.set(
            Pagination<PaginationResultItem>([
                .init(name: "charmander"),
                .init(name: "bulbasour")
            ]),
            key: CacheKey("20/10")
        )
        
        waitUntil { done in
            repository.fetchPokemons(20, limit: 10) { response in
                do {
                    let result = try response.get()

                    expect(result.count) == 2
                    expect(result.results.first?.name) == "charmander"
                    expect(result.results.last?.name) == "bulbasour"
                    
                    expect(apiSpy.offset).to(beNil())
                    expect(apiSpy.limit).to(beNil())
                    expect(apiSpy.items).to(be([]))
                } catch {
                    fail(error.localizedDescription)
                }

                done()
            }
        }
        
    }
    
    func testThrowErrorIfFetchPokemonsFails() {
        let apiSpy = PokemonAPISpy()
        apiSpy.error = "Simulação de erro"
        
        let cacheSpy = CacheSpy()
        let repository = PokemonRepository(apiSpy, cache: cacheSpy)
        
        waitUntil { done in
            repository.fetchPokemons(20, limit: 10) { response in
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
    
    func testShouldReturnDataIfFetchPokemonSuccess() {
        let apiSpy = PokemonAPISpy()
        apiSpy.pokemon = Pokemon(
            name: "squartle",
            order: 5,
            weight: 33,
            types: [
                .init(slot: 1, type: .water)
            ],
            sprites: .init(other: .init(officialArtwork: .init(frontDefault: URL(string: "http://www.img.com.br")!))),
            abilities: []
        )
        
        let cacheSpy = CacheSpy()
        let repository = PokemonRepository(apiSpy, cache: cacheSpy)
        
        waitUntil { done in
            repository.fetchPokemon("squirtle") { response in
                do {
                    let result = try response.get()
                    
                    expect(result.types.first?.slot) == 1
                    expect(result.types.first?.type.rawValue) == "water"
                    expect(result.weight) == 33
                    
                    let cache = try cacheSpy.get(
                        type: Pokemon.self,
                        key: CacheKey("squirtle")
                    )
                    
                    expect(cache?.types.first?.slot) == 1
                    expect(cache?.types.first?.type.rawValue) == "water"
                } catch {
                    fail(error.localizedDescription)
                }
                
                done()
            }
        }
        
    }
    
    func testShouldReturnPokemonDataFromCacheData() throws {
        let apiSpy = PokemonAPISpy()
        let cacheSpy = CacheSpy()
        let repository = PokemonRepository(apiSpy, cache: cacheSpy)
        
        try cacheSpy.set(
            Pokemon(
                name: "lapras",
                order: 44,
                weight: 33,
                types: [
                    .init(slot: 1, type: .water)
                ],
                sprites: .init(other: .init(officialArtwork: .init(frontDefault: URL(string: "http://images.com")!))),
                abilities: []
            ),
            key: CacheKey("squirtle")
        )
        
        waitUntil { done in
            repository.fetchPokemon("squirtle") { response in
                do {
                    let result = try response.get()

                    expect(result.types.first?.slot) == 1
                    expect(result.types.first?.type.rawValue) == "water"
                    expect(result.weight) == 33
                    
                    expect(apiSpy.pokemon).to(beNil())
                } catch {
                    fail(error.localizedDescription)
                }

                done()
            }
        }
        
    }
    
    func testThrowErrorIfFetchPokemonFails() {
        let apiSpy = PokemonAPISpy()
        apiSpy.error = "Simulação de erro"
        
        let cacheSpy = CacheSpy()
        let repository = PokemonRepository(apiSpy, cache: cacheSpy)
        
        waitUntil { done in
            repository.fetchPokemon("magmar") { response in
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
