//
//  GetGenerationsUseCase.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 23/01/21.
//

import Foundation

protocol FetchGenerationsUseCaseProtocol {
    func execute(completionHandler: @escaping (Result<[PaginationResultItem], Error>) -> Void)
}

final class FetchGenerationsUseCase: FetchGenerationsUseCaseProtocol {
    
    private let generationRepository: GenerationRepositoryProtocol
    
    init(_ generationRepository: GenerationRepositoryProtocol) {
        self.generationRepository = generationRepository
    }
    
    func execute(completionHandler: @escaping (Result<[PaginationResultItem], Error>) -> Void) {
        generationRepository.fetchGenerations { response in
            do {
                let result = try response.get()
                let generations = result.results
                completionHandler(.success(generations))
            } catch {
                completionHandler(.failure(error))
            }
        }
    }
    
}
