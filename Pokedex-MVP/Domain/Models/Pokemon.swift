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
    let abilities: [Ability]
}

public struct Ability: Codable {
    let name: String
    let slot: Int
    
    private enum CodingKeys: String, CodingKey {
        case slot, name, ability
    }
}

extension Ability {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        slot = try container.decode(Int.self, forKey: .slot)
        
        if let ability = try container.decode([String: String].self, forKey: .ability)["name"] {
            name = ability
        } else {
            throw "### The propertie ability does not be read ###"
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(slot, forKey: .slot)
    }
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
