//
//  Pokemon.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 24/01/21.
//

import Foundation

public struct Pokemon: Codable {
    let name: String
    let order: Int
    let weight: Int
    let types: [TypeItem]
    let sprites: Sprites
}

public struct TypeItem: Codable {
    let slot: Int
    let type: PokemonType
}

public struct Sprites: Codable {
    let other: Other
    
    struct Other: Codable {
        let officialArtwork: Sprite
        
        private enum CodingKeys: String, CodingKey {
            case officialArtwork = "official-artwork"
        }
    }
    
    struct Sprite: Codable {
        let frontDefault: URL
        
        private enum CodingKeys: String, CodingKey {
            case frontDefault = "front_default"
        }
    }
}
