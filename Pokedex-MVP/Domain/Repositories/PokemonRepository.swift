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
    
    private let api: PokemonAPI
    
    init(api: PokemonAPI) {
        self.api = api
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
