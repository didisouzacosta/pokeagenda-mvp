//
//  GetGenerationUseCase.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 23/01/21.
//

import Foundation

protocol FetchGenerationUseCaseProtocol {
    func execute(_ name: String, completionHandler: @escaping (Result<Generation, Error>) -> Void)
}

final class FetchGenerationUseCase: FetchGenerationUseCaseProtocol {
    
    private let pokemonRepository: PokemonRepositoryProtocol
    
    init(pokemonRepository: PokemonRepositoryProtocol) {
        self.pokemonRepository = pokemonRepository
    }
    
    func execute(_ name: String, completionHandler: @escaping (Result<Generation, Error>) -> Void) {
        
    }
    
}
