//
//  Generation.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 23/01/21.
//

import Foundation

struct Generation: Codable {
    let id: Int
    let pokemons: [PokemonSpecieResultItem]
    
    private enum CodingKeys: String, CodingKey {
        case id, pokemons = "pokemon_species"
    }
}

struct PokemonSpecieResultItem: Codable {
    let name: String
}
