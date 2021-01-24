//
//  Pokemon.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 24/01/21.
//

import Foundation

struct Pokemon: Codable {
    let weight: Int
    let types: [TypeItem]
    let sprites: Sprites
}

struct TypeItem: Codable {
    let slot: Int
    let type: Type
    
    struct `Type`: Codable {
        let name: String?
    }
}

struct Sprites: Codable {
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
