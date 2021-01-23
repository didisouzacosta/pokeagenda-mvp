//
//  GetGenerationsUseCase.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 23/01/21.
//

import Foundation

protocol GetGenerationsUseCaseProtocol {
    func execute(completionHandler: @escaping (Result<[Generation], Error>) -> Void)
}

final class GetGenerationsUseCase: GetGenerationsUseCaseProtocol {
    
    private let pokemonRepository: PokemonRepositoryProtocol
    
    init(pokemonRepository: PokemonRepositoryProtocol) {
        self.pokemonRepository = pokemonRepository
    }
    
    func execute(completionHandler: @escaping (Result<[Generation], Error>) -> Void) {
        pokemonRepository.getGenerations { response in
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
