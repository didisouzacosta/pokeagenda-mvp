//
//  GenerationRepositoryTests.swift
//  Pokedex-MVPTests
//
//  Created by Adriano Souza Costa on 24/01/21.
//

import XCTest
import Nimble

@testable import Pokedex_MVP

class GenerationRepositoryTests: XCTestCase {

    func testShouldReturnIfFetchGenerationsSuccess() {
        let apiSpy = PokemonAPISpy()
        apiSpy.items = [
            .init(name: "generation-i"),
            .init(name: "generation-ii")
        ]
        
        let cacheSpy = CacheSpy()
        let repository = GenerationRepository(apiSpy, cache: cacheSpy)
        
        waitUntil { done in
            repository.fetchGenerations() { response in
                do {
                    let result = try response.get()
                    
                    expect(result.count) == 2
                    expect(result.results.first?.name) == "generation-i"
                    expect(result.results.last?.name) == "generation-ii"
                    
                    let cache = try cacheSpy.get(
                        type: Pagination<PaginationResultItem>.self,
                        key: CacheKey("generations")
                    )
                    
                    expect(cache?.count) == 2
                    expect(cache?.results.first?.name) == "generation-i"
                    expect(cache?.results.last?.name) == "generation-ii"
                } catch {
                    fail(error.localizedDescription)
                }
                
                done()
            }
        }
        
    }
    
    func testShouldReturnGenerationsDataFromCacheData() throws {
        let apiSpy = PokemonAPISpy()
        let cacheSpy = CacheSpy()
        let repository = GenerationRepository(apiSpy, cache: cacheSpy)
        
        try cacheSpy.set(
            Pagination<PaginationResultItem>([
                .init(name: "generation-i"),
                .init(name: "generation-ii")
            ]),
            key: CacheKey("generations")
        )
        
        waitUntil { done in
            repository.fetchGenerations() { response in
                do {
                    let result = try response.get()

                    expect(result.count) == 2
                    expect(result.results.first?.name) == "generation-i"
                    expect(result.results.last?.name) == "generation-ii"
                    
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
    
    func testThrowErrorIfFetchGenerationsFails() {
        let apiSpy = PokemonAPISpy()
        apiSpy.error = "Simulação de erro"
        
        let cacheSpy = CacheSpy()
        let repository = GenerationRepository(apiSpy, cache: cacheSpy)
        
        waitUntil { done in
            repository.fetchGenerations() { response in
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
