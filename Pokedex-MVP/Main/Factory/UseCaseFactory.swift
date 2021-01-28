//
//  UseCase.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 23/01/21.
//

import Foundation

final class UseCaseFactory {
    
    static private let network = AlamofireNetwork()
    static private let api = PokemonAPI(network: network)
    static private let cache = MemoryCache.instance
    static private let pokemonRepository = PokemonRepository(api, cache: cache)
    static private let generationRepository = GenerationRepository(api, cache: cache)
    
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
