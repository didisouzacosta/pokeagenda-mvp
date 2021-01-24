//
//  FetchPokemonsUseCase.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 24/01/21.
//

import Foundation

protocol FetchPokemonsUseCaseProtocol {
    func execute(page: Int, completionHandler: @escaping (Result<[PaginationResultItem], Error>) -> Void)
}

final class FetchPokemonsUseCase: FetchPokemonsUseCaseProtocol {
    
    // MARK: - Private Properties
    
    private let pokemonRepository: PokemonRepositoryProtocol
    private let limit = 20
    
    // MARK: - Public Methods
    
    init(_ pokemonRepository: PokemonRepositoryProtocol) {
        self.pokemonRepository = pokemonRepository
    }
    
    func execute(page: Int, completionHandler: @escaping (Result<[PaginationResultItem], Error>) -> Void) {
        let offset = calculateOffset(with: page)
        
        pokemonRepository.fetchPokemons(offset, limit: limit) { response in
            do {
                let result = try response.get()
                completionHandler(.success(result.results))
            } catch {
                completionHandler(.failure(error))
            }
        }
    }
    
    // MARK: - Private Methods
    
    func calculateOffset(with page: Int) -> Int {
        let finalPage = page - 1
        return (finalPage < 0 ? 0 : finalPage) * limit
    }
    
}
