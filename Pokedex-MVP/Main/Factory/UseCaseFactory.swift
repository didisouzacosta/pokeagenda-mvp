//
//  UseCase.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 23/01/21.
//

import Foundation

final class UseCaseFactory {
    
    static let network = AlamofireNetwork()
    static let api = PokemonAPI(network: network)
    static let cache = MemoryCache.instance
    static let pokemonRepository = PokemonRepository(api, cache: cache)
    static let generationRepository = GenerationRepository(api: api, cache: cache)
    
    static func makeFetchGenerationsUseCase() -> FetchGenerationsUseCase {
        return FetchGenerationsUseCase(generationRepository)
    }
    
    static func makeFetchPokemonUseCase() -> FetchPokemonUseCase {
        return FetchPokemonUseCase(pokemonRepository)
    }
    
    static func makeFetchPokemonsUseCase() -> FetchPokemonsUseCase {
        return FetchPokemonsUseCase(pokemonRepository)
    }
    
}
