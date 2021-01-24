//
//  PokemonAPISpy.swift
//  Pokedex-MVPTests
//
//  Created by Adriano Souza Costa on 24/01/21.
//

import Foundation
import Pokedex_MVP

final class PokemonAPISpy: PokemonAPIProtocol {
    
    var baseURL: URL = URL(string: "https://fake.api.com")!
    var items: [PaginationResultItem] = []
    var error: Error?
    var offset: Int?
    var limit: Int?
    var name: String?
    var pokemon: Pokemon?
    
    func fetchGenerations(
        completionHandler: @escaping (Result<Pagination<PaginationResultItem>, Error>) -> Void
    ) {
        if let error = error {
            completionHandler(.failure(error))
            return
        }
        
        let pagination = Pagination<PaginationResultItem>(items)
        
        completionHandler(.success(pagination))
    }
    
    func fetchPokemons(
        _ offset: Int,
        limit: Int,
        completionHandler: @escaping (Result<Pagination<PaginationResultItem>, Error>) -> Void
    ) {
        self.offset = offset
        self.limit = limit
        
        if let error = error {
            completionHandler(.failure(error))
            return
        }
        
        let pagination = Pagination<PaginationResultItem>(items)
        
        completionHandler(.success(pagination))
    }
    
    func fetchPokemon(
        _ name: String,
        completionHandler: @escaping (Result<Pokemon, Error>) -> Void
    ) {
        self.name = name
        
        if let error = error {
            completionHandler(.failure(error))
            return
        } else if let pokemon = self.pokemon {
            completionHandler(.success(pokemon))
        }
    }
    
}
