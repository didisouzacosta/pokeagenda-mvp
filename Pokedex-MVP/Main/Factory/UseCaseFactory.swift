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
        let repository = PokemonRepository(api: api)
        return FetchGenerationsUseCase(pokemonRepository: repository)
    }
    
    static func makeFetchGenerationUseCase() -> FetchGenerationUseCase {
        let network = AlamofireNetwork()
        let api = PokemonAPI(network: network)
        let repository = PokemonRepository(api: api)
        return FetchGenerationUseCase(pokemonRepository: repository)
    }
    
    static func makeFetchPokemonUseCase() -> FetchPokemonUseCase {
        let network = AlamofireNetwork()
        let api = PokemonAPI(network: network)
        let repository = PokemonRepository(api: api)
        return FetchPokemonUseCase(pokemonRepository: repository)
    }
    
}
