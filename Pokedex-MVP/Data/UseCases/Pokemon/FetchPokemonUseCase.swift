//
//  FetchPokemonUseCase.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 24/01/21.
//

import Foundation

public protocol FetchPokemonUseCaseProtocol {
    func execute(_ name: String, completionHandler: @escaping (Result<Pokemon, Error>) -> Void)
}

public final class FetchPokemonUseCase: FetchPokemonUseCaseProtocol {
    
    // MARK: - Private Properties
    
    private let pokemonRepository: PokemonRepositoryProtocol
    private let minNameLength = 3
    
    // MARK: - Public Methods
    
    public init(_ pokemonRepository: PokemonRepositoryProtocol) {
        self.pokemonRepository = pokemonRepository
    }
    
    public func execute(_ name: String, completionHandler: @escaping (Result<Pokemon, Error>) -> Void) {
        guard name.count >= minNameLength else { return }
        pokemonRepository.fetchPokemon(name, completionHandler: completionHandler)
    }
    
}