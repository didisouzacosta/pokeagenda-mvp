//
//  PokemonViewModel.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 31/01/21.
//

import Foundation
import UIKit

struct PokemonViewModel {
    
    // MARK: - Public Properties
    
    var name: String {
        return pokemon.name.capitalized
    }
    
    var order: String {
        return "#\(pokemon.order)"
    }
    
    var image: URL {
        return pokemon.sprites.other.officialArtwork.frontDefault
    }
    
    var weight: Int {
        return pokemon.weight
    }
    
    var types: [PokemonType] {
        return pokemon.types.sorted { (a, b) -> Bool in
            return a.slot < b.slot
        }.map { $0.type }
    }
    
    var primaryType: PokemonType {
        return types.first!
    }
    
    var color: UIColor {
        return Colors.type.color(with: primaryType)
    }
    
    // MARK: - Private Properties
    
    private let pokemon: Pokemon
    
    // MARK: - Public Properties
    
    init(_ pokemon: Pokemon) {
        self.pokemon = pokemon
    }
    
}
