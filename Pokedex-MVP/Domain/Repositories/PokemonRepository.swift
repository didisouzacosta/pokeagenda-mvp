//
//  PokemonRepository.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 23/01/21.
//

import Foundation

protocol PokemonRepositoryProtocol {
    func fetchGenerations(completionHandler: @escaping (Result<Pagination<GenerationResultItem>, Error>) -> Void)
    func fetchGeneration(_ name: String, completionHandler: @escaping (Result<Generation, Error>) -> Void)
    func fetchPokemon(_ name: String, completionHandler: @escaping (Result<Pokemon, Error>) -> Void)
}

final class PokemonRepository: PokemonRepositoryProtocol {
    
    // MARK: - Private Properties
    
    private let api: PokemonAPIProtocol
    private let cache: CacheProtocol
    
    // MARK: - Public Methods
    
    init(api: PokemonAPIProtocol, cache: CacheProtocol) {
        self.api = api
        self.cache = cache
    }
    
    func fetchGenerations(
        completionHandler: @escaping (Result<Pagination<GenerationResultItem>, Error>) -> Void
    ) {
        api.fetchGenerations(completionHandler: completionHandler)
    }
    
    func fetchGeneration(
        _ name: String,
        completionHandler: @escaping (Result<Generation, Error>) -> Void
    ) {
        api.fetchGeneration(name, completionHandler: completionHandler)
    }
    
    func fetchPokemon(
        _ name: String,
        completionHandler: @escaping (Result<Pokemon, Error>) -> Void
    ) {
        api.fetchPokemon(name, completionHandler: completionHandler)
    }
}
