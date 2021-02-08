//
//  PokemonViewModelTests.swift
//  Pokedex-MVPTests
//
//  Created by Adriano Souza Costa on 08/02/21.
//

import XCTest
import Nimble

@testable import Pokedex_MVP

class PokemonViewModelTests: XCTestCase {

    private let url = URL(string: "https://pokemon.com.br")!
    
    func testEnsureOrderFormatterConsistency() throws {
        let pokemon = Pokemon(
            name: "charmander",
            order: 23,
            weight: 4,
            types: [],
            sprites: .init(other: .init(officialArtwork: .init(frontDefault: url))),
            abilities: [],
            stats: []
        )
        
        let viewModel = PokemonViewModel(pokemon)
        
        expect(viewModel.order) == "#023"
    }
    
    func testEnsureImageUrlConsistency() throws {
        let pokemon = Pokemon(
            name: "charmander",
            order: 23,
            weight: 4,
            types: [],
            sprites: .init(other: .init(officialArtwork: .init(frontDefault: url))),
            abilities: [],
            stats: []
        )
        
        let viewModel = PokemonViewModel(pokemon)
        
        expect(viewModel.image) == url
    }
    
    func testEnsureTypesConsistency() throws {
        let pokemon = Pokemon(
            name: "charmander",
            order: 23,
            weight: 4,
            types: [
                .init(slot: 10, type: .dark),
                .init(slot: 1, type: .fire),
                .init(slot: 3, type: .water),
            ],
            sprites: .init(other: .init(officialArtwork: .init(frontDefault: url))),
            abilities: [],
            stats: []
        )
        
        let viewModel = PokemonViewModel(pokemon)
        
        expect(viewModel.primaryType) == .fire
        expect(viewModel.types) == [.fire, .water, .dark]
    }
    
    func testEnsureAbilitiesConsistency() throws {
        let pokemon = Pokemon(
            name: "charmander",
            order: 23,
            weight: 4,
            types: [],
            sprites: .init(other: .init(officialArtwork: .init(frontDefault: url))),
            abilities: [
                .init(name: "Ability 2", slot: 2),
                .init(name: "Ability 1", slot: 1)
            ],
            stats: []
        )
        
        let viewModel = PokemonViewModel(pokemon)
        
        expect(viewModel.abilities) == ["Ability 1", "Ability 2"]
    }
    
    func testEnsureStatsConsistency() throws {
        let pokemon = Pokemon(
            name: "charmander",
            order: 23,
            weight: 4,
            types: [],
            sprites: .init(other: .init(officialArtwork: .init(frontDefault: url))),
            abilities: [],
            stats: [
                .init(value: 33, name: "hp"),
                .init(value: 1, name: "attack"),
                .init(value: 2, name: "defense"),
                .init(value: 4, name: "special-attack"),
                .init(value: 5, name: "special-defense"),
                .init(value: 6, name: "speed"),
            ]
        )
        
        let viewModel = PokemonViewModel(pokemon)
        
        expect(viewModel.stats.count) == 6
        expect(viewModel.stats[0].name) == "HP"
        expect(viewModel.stats[0].percentage) == 33
        
        expect(viewModel.stats[1].name) == "Attack"
        expect(viewModel.stats[1].percentage) == 1
        
        expect(viewModel.stats[2].name) == "Defense"
        expect(viewModel.stats[2].percentage) == 2
        
        expect(viewModel.stats[3].name) == "Special Attack"
        expect(viewModel.stats[3].percentage) == 4
        
        expect(viewModel.stats[4].name) == "Special Defense"
        expect(viewModel.stats[4].percentage) == 5
        
        expect(viewModel.stats[5].name) == "Speed"
        expect(viewModel.stats[5].percentage) == 6
    }

}
