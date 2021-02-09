//
//  FetchPokemonsSpy.swift
//  Pokedex-MVPTests
//
//  Created by Adriano Souza Costa on 08/02/21.
//

import Foundation
import Pokedex_MVP

class FetchPokemonSpy: FetchPokemonUseCaseProtocol {
    
    var pokemon: Pokemon?
    var error: Error?
    var identifier: PokemonIndentifier?
    
    func execute(
        _ identifier: PokemonIndentifier,
        completionHandler: @escaping (Result<Pokemon, Error>) -> Void
    ) {
        self.identifier = identifier
        
        if let error = error {
            completionHandler(.failure(error))
        } else if let pokemon = pokemon {
            completionHandler(.success(pokemon))
        } else {
            completionHandler(.failure("Simulação de erro"))
        }
    }
    
}
