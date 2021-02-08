//
//  FetchPokemonUseCase.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 24/01/21.
//

import Foundation

public typealias PokemonIndentifier = String

public protocol FetchPokemonUseCaseProtocol {
    func execute(
        _ identifier: PokemonIndentifier,
        completionHandler: @escaping (Result<Pokemon, Error>) -> Void
    )
}

public final class FetchPokemonUseCase: FetchPokemonUseCaseProtocol {
    
    // MARK: - Public Properties
    
    public static let minNameLength = 3
    
    // MARK: - Private Properties
    
    private let pokemonRepository: PokemonRepositoryProtocol
    
    // MARK: - Public Methods
    
    public init(_ pokemonRepository: PokemonRepositoryProtocol) {
        self.pokemonRepository = pokemonRepository
    }
    
    public func execute(
        _ identifier: PokemonIndentifier,
        completionHandler: @escaping (Result<Pokemon, Error>) -> Void
    ) {
        guard identifier.count >= FetchPokemonUseCase.minNameLength else { return }
        print(identifier)
        pokemonRepository.fetchPokemon(
            identifier.lowercased(),
            completionHandler: completionHandler
        )
    }
    
}
