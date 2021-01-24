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
    
    // MARK: - Private Properties
    
    private let pokemonRepository: PokemonRepositoryProtocol
    private let minNameCount = 3
    
    // MARK: - Public Methods
    
    init(pokemonRepository: PokemonRepositoryProtocol) {
        self.pokemonRepository = pokemonRepository
    }
    
    func execute(_ name: String, completionHandler: @escaping (Result<Pokemon, Error>) -> Void) {
        guard name.count >= minNameCount else { return }
        pokemonRepository.fetchPokemon(name, completionHandler: completionHandler)
    }
    
}
