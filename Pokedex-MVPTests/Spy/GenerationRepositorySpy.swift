//
//  GenerationRepositorySpy.swift
//  Pokedex-MVPTests
//
//  Created by Adriano Souza Costa on 27/01/21.
//

import Foundation
import Pokedex_MVP

class GenerationRepositorySpy: GenerationRepositoryProtocol {
    
    var pagination: Pagination<PaginationResultItem>?
    var error: Error?
    
    func fetchGenerations(
        completionHandler: @escaping (Result<Pagination<PaginationResultItem>, Error>) -> Void
    ) {
        if let error = self.error {
            completionHandler(.failure(error))
        } else if let pagination = self.pagination {
            completionHandler(.success(pagination))
        }
    }
    
}
