//
//  PokemonAPI.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 23/01/21.
//

import Foundation

protocol APIProtocol {
    var baseURL: URL { get }
}

protocol PokemonAPIProtocol: APIProtocol {
    func fetchGenerations(completionHandler: @escaping (Result<Pagination<PaginationResultItem>, Error>) -> Void)
    func fetchPokemons(offset: Int, limit: Int, completionHandler: @escaping (Result<Pagination<PaginationResultItem>, Error>) -> Void)
    func fetchPokemon(_ name: String, completionHandler: @escaping (Result<Pokemon, Error>) -> Void)
}

final class PokemonAPI: PokemonAPIProtocol {
    
    private let network: NetworkProtocol
    
    var baseURL: URL {
        return URL(string: "https://pokeapi.co/api/v2/")!
    }
    
    init(network: NetworkProtocol) {
        self.network = network
    }
    
    func fetchGenerations(completionHandler: @escaping (Result<Pagination<PaginationResultItem>, Error>) -> Void) {
        network.request(
            type: Pagination<PaginationResultItem>.self,
            endpoint: baseURL.appendingPathComponent("generation"),
            method: .get,
            parameters: nil
        ) { (response) in
            completionHandler(response)
        }
    }
    
    func fetchPokemons(
        offset: Int,
        limit: Int,
        completionHandler: @escaping (Result<Pagination<PaginationResultItem>, Error>) -> Void
    ) {
        network.request(
            type: Pagination<PaginationResultItem>.self,
            endpoint: baseURL.appendingPathComponent("pokemon"),
            method: .get,
            parameters: [
                "offset": offset,
                "limit": limit
            ]
        ) { (response) in
            completionHandler(response)
        }
    }
    
    func fetchPokemon(
        _ name: String,
        completionHandler: @escaping (Result<Pokemon, Error>) -> Void
    ) {
        network.request(
            type: Pokemon.self,
            endpoint: baseURL.appendingPathComponent("pokemon/\(name)"),
            method: .get,
            parameters: nil
        ) { (response) in
            completionHandler(response)
        }
    }
}
