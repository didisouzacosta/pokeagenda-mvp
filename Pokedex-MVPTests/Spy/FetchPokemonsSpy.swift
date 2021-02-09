//
//  FetchPokemonsSpy.swift
//  Pokedex-MVPTests
//
//  Created by Adriano Souza Costa on 08/02/21.
//

import Foundation
import Pokedex_MVP

class FetchPokemonsSpy: FetchPokemonsUseCaseProtocol {
    
    var items: [PaginationResultItem] = []
    var error: Error?
    var page: Int?
    
    func execute(
        page: Int,
        completionHandler: @escaping (Result<[PaginationResultItem], Error>) -> Void
    ) {
        self.page = page
        
        if let error = error {
            completionHandler(.failure(error))
        } else {
            completionHandler(.success(items))
        }
    }
    
}
