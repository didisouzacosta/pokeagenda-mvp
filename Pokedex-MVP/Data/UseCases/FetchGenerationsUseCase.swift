//
//  GetGenerationsUseCase.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 23/01/21.
//

import Foundation

protocol FetchGenerationsUseCaseProtocol {
    func execute(completionHandler: @escaping (Result<[GenerationResultItem], Error>) -> Void)
}

final class FetchGenerationsUseCase: FetchGenerationsUseCaseProtocol {
    
    private let pokemonRepository: PokemonRepositoryProtocol
    
    init(pokemonRepository: PokemonRepositoryProtocol) {
        self.pokemonRepository = pokemonRepository
    }
    
    func execute(completionHandler: @escaping (Result<[GenerationResultItem], Error>) -> Void) {
        pokemonRepository.fetchGenerations { response in
            do {
                let result = try response.get()
                let generations = result.results
                completionHandler(.success(generations))
            } catch {
                completionHandler(.failure(error))
            }
        }
    }
    
}
