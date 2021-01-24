//
//  FetchPokemonUseCase.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 24/01/21.
//

import Foundation

protocol FetchPokemonUseCaseProtocol {
    func execute(_ name: String, completionHandler: @escaping (Result<Pokemon, Error>) -> Void)
}

final class FetchPokemonUseCase: FetchPokemonUseCaseProtocol {
    
    private let pokemonRepository: PokemonRepositoryProtocol
    
    init(pokemonRepository: PokemonRepositoryProtocol) {
        self.pokemonRepository = pokemonRepository
    }
    
    func execute(_ name: String, completionHandler: @escaping (Result<Pokemon, Error>) -> Void) {
        pokemonRepository.fetchPokemon(name, completionHandler: completionHandler)
    }
    
}
