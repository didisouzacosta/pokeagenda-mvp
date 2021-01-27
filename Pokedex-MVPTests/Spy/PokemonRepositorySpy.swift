//
//  PokemonRepositorySpy.swift
//  Pokedex-MVPTests
//
//  Created by Adriano Souza Costa on 27/01/21.
//

import Foundation
import Pokedex_MVP

class PokemonRepository: PokemonRepositoryProtocol {
    
    var offset: Int?
    var limit: Int?
    var error: Error?
    var name: String?
    var pagination: Pagination<PaginationResultItem>?
    var pokemon: Pokemon?
    
    func fetchPokemons(
        _ offset: Int,
        limit: Int,
        completionHandler: @escaping (Result<Pagination<PaginationResultItem>, Error>) -> Void
    ) {
        self.offset = offset
        self.limit = limit
        
        if let error = self.error {
            completionHandler(.failure(error))
        } else if let pagination = self.pagination {
            completionHandler(.success(pagination))
        }
    }
    
    func fetchPokemon(
        _ name: String,
        completionHandler: @escaping (Result<Pokemon, Error>) -> Void
    ) {
        self.name = name
         
        if let error = self.error {
            completionHandler(.failure(error))
        } else if let pokemon = self.pokemon {
            completionHandler(.success(pokemon))
        }
    }
    
}
