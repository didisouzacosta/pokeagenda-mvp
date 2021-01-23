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
    func getGenerations(completionHandler: @escaping (Result<Pagination<Generation>, Error>) -> Void)
}

final class PokemonAPI: PokemonAPIProtocol {
    
    private let network: NetworkProtocol
    
    var baseURL: URL {
        return URL(string: "https://pokeapi.co/api/v2/")!
    }
    
    func getGenerations(completionHandler: @escaping (Result<Pagination<Generation>, Error>) -> Void) {
        network.request(
            type: Pagination<Generation>.self,
            endpoint: baseURL.appendingPathComponent("generation"),
            method: .get,
            parameters: nil
        ) { (response) in
            completionHandler(response)
        }
    }
    
    init(network: NetworkProtocol) {
        self.network = network
    }
}
