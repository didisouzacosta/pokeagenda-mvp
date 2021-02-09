//
//  PokemonViewModel.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 31/01/21.
//

import Foundation
import UIKit

public struct PokemonViewModel {
    
    // MARK: - Public Properties
    
    var name: String {
        return pokemon.name.capitalized
    }
    
    var order: String {
        return String(format: "#%03d", pokemon.order)
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
    
    var abilities: [String] {
        return pokemon.abilities.sorted { (a, b) -> Bool in
            return a.slot < b.slot
        }.map { $0.name.capitalized }
    }
    
    var stats: [StatViewModel] {
        return pokemon.stats.map(StatViewModel.init)
    }
    
    // MARK: - Private Properties
    
    private let pokemon: Pokemon
    
    // MARK: - Public Properties
    
    init(_ pokemon: Pokemon) {
        self.pokemon = pokemon
    }
    
}
