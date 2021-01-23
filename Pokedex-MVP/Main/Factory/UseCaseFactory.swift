//
//  UseCase.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 23/01/21.
//

import Foundation

final class UseCaseFactory {
    
    static func makeGetGenerationsUseCase() -> GetGenerationsUseCaseProtocol {
        let network = AlamofireNetwork()
        let api = PokemonAPI(network: network)
        let repository = PokemonRepository(api: api)
        return GetGenerationsUseCase(pokemonRepository: repository)
    }
    
}
