//
//  Pokemon.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 24/01/21.
//

import Foundation

struct Pokemon: Decodable {
    let weight: Int
    let types: [TypeItem]
    let sprites: Sprites
}

struct TypeItem: Decodable {
    let slot: Int
    let type: Type
    
    struct `Type`: Decodable {
        let name: String?
    }
}

struct Sprites: Decodable {
    let other: Other
    
    struct Other: Decodable {
        let officialArtwork: Sprite
        
        private enum CodingKeys: String, CodingKey {
            case officialArtwork = "official-artwork"
        }
    }
    
    struct Sprite: Decodable {
        let frontDefault: URL
        
        private enum CodingKeys: String, CodingKey {
            case frontDefault = "front_default"
        }
    }
}
