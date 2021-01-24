//
//  UseCase.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 23/01/21.
//

import Foundation

final class UseCaseFactory {
    
    static func makeFetchGenerationsUseCase() -> FetchGenerationsUseCase {
        let network = AlamofireNetwork()
        let api = PokemonAPI(network: network)
        let cache = MemoryCache.instance
        let repository = PokemonRepository(api: api, cache: cache)
        return FetchGenerationsUseCase(pokemonRepository: repository)
    }
    
    static func makeFetchGenerationUseCase() -> FetchGenerationUseCase {
        let network = AlamofireNetwork()
        let api = PokemonAPI(network: network)
        let cache = MemoryCache.instance
        let repository = PokemonRepository(api: api, cache: cache)
        return FetchGenerationUseCase(pokemonRepository: repository)
    }
    
    static func makeFetchPokemonUseCase() -> FetchPokemonUseCase {
        let network = AlamofireNetwork()
        let api = PokemonAPI(network: network)
        let cache = MemoryCache.instance
        let repository = PokemonRepository(api: api, cache: cache)
        return FetchPokemonUseCase(pokemonRepository: repository)
    }
    
}
