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
        let cacheKey = CacheKey("generations")
        
        if let cacheData = try? cache.get(type: Pagination<GenerationResultItem>.self, key: cacheKey) {
            print("Using cache data from `fetchGenerations`")
            completionHandler(.success(cacheData))
            return
        }
        
        api.fetchGenerations { [weak self] response in
            do {
                let result = try response.get()
                
                try self?.cache.set(result, key: cacheKey)
                
                completionHandler(.success(result))
            } catch {
                completionHandler(.failure(error))
            }
        }
    }
    
    func fetchGeneration(
        _ name: String,
        completionHandler: @escaping (Result<Generation, Error>) -> Void
    ) {
        let cacheKey = CacheKey(name)
        
        if let cacheData = try? cache.get(type: Generation.self, key: cacheKey) {
            print("Using cache data from `fetchGeneration:\(name)`")
            completionHandler(.success(cacheData))
            return
        }
        
        api.fetchGeneration(name) { [weak self] response in
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
        
        if let cacheData = try? cache.get(type: Pokemon.self, key: cacheKey) {
            print("Using cache data from `fetchPokemon:\(name)`")
            completionHandler(.success(cacheData))
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
