//
//  PokemonAPI.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 23/01/21.
//

import Foundation

protocol PokemonAPIProtocol: APIProtocol {
    func getGenerations(completionHandler: @escaping (Result<Pagination<Generation>, Error>) -> Void)
}
