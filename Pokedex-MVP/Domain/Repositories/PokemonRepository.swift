//
//  PokemonRepository.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 23/01/21.
//

import Foundation

protocol PokemonRepositoryProtocol {
    func getGenerations(completionHandler: @escaping (Result<Pagination<Generation>, Error>) -> Void)
}

final class PokemonRepository: PokemonRepositoryProtocol {
    
    private let api: PokemonAPI
    
    init(api: PokemonAPI) {
        self.api = api
    }
    
    func getGenerations(completionHandler: @escaping (Result<Pagination<Generation>, Error>) -> Void) {
        api.getGenerations(completionHandler: completionHandler)
    }
}
