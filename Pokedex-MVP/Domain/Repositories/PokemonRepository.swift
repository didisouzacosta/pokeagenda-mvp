//
//  PokemonRepository.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 23/01/21.
//

import Foundation

protocol PokemonRepositoryProtocol {
    func fetchPokemons(_ offset: Int, limit: Int, completionHandler: @escaping (Result<Pagination<PaginationResultItem>, Error>) -> Void)
    func fetchPokemon(_ name: String, completionHandler: @escaping (Result<Pokemon, Error>) -> Void)
}

public final class PokemonRepository: PokemonRepositoryProtocol {
    
    // MARK: - Private Properties
    
    private let api: PokemonAPIProtocol
    private let cache: CacheProtocol
    
    // MARK: - Public Methods
    
    init(_ api: PokemonAPIProtocol, cache: CacheProtocol) {
        self.api = api
        self.cache = cache
    }
    
    public func fetchPokemons(
        _ offset: Int,
        limit: Int,
        completionHandler: @escaping (Result<Pagination<PaginationResultItem>, Error>) -> Void
    ) {
        let cacheKey = CacheKey("\(offset)/\(limit)")
        let cacheData = try? cache.get(type: Pagination<PaginationResultItem>.self, key: cacheKey)
        
        if let cache = cacheData {
            print("Using cached data to `fetchPokemons:\(offset)/\(limit)`")
            completionHandler(.success(cache))
            return
        }
        
        api.fetchPokemons(offset, limit: limit) { [weak self] response in
            do {
                let result = try response.get()
                
                try self?.cache.set(result, key: cacheKey)
                
                completionHandler(.success(result))
            } catch {
                completionHandler(.failure(error))
            }
        }
    }
    
    func fetchPokemon(
        _ name: String,
        completionHandler: @escaping (Result<Pokemon, Error>) -> Void
    ) {
        let cacheKey = CacheKey(name)
        let cacheData = try? cache.get(type: Pokemon.self, key: cacheKey)
        
        if let cache = cacheData {
            print("Using cached data to `fetchPokemon:\(name)`")
            completionHandler(.success(cache))
            return
        }
        
        api.fetchPokemon(name) { [weak self] response in
            do {
                let result = try response.get()
                
                try self?.cache.set(result, key: cacheKey)
                
                completionHandler(.success(result))
            } catch {
                completionHandler(.failure(error))
            }
        }
    }
}
