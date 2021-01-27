//
//  GenerationRepository.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 24/01/21.
//

import Foundation

public protocol GenerationRepositoryProtocol {
    func fetchGenerations(completionHandler: @escaping (Result<Pagination<PaginationResultItem>, Error>) -> Void)
}

public final class GenerationRepository: GenerationRepositoryProtocol {
    
    // MARK: - Private Properties
    
    private let api: PokemonAPIProtocol
    private let cache: CacheProtocol
    
    // MARK: - Public Methods
    
    init(_ api: PokemonAPIProtocol, cache: CacheProtocol) {
        self.api = api
        self.cache = cache
    }
    
    public func fetchGenerations(
        completionHandler: @escaping (Result<Pagination<PaginationResultItem>, Error>) -> Void
    ) {
        let cacheKey = CacheKey("generations")
        let cacheData = try? cache.get(type: Pagination<PaginationResultItem>.self, key: cacheKey)
        
        if let cache = cacheData {
            print("Using cached data to `fetchGenerations`")
            completionHandler(.success(cache))
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
    
}
