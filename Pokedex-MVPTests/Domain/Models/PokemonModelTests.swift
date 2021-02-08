//
//  PokemonModelTests.swift
//  Pokedex-MVPTests
//
//  Created by Adriano Souza Costa on 24/01/21.
//

import XCTest
import Nimble

@testable import Pokedex_MVP

class PokemonModelTests: XCTestCase {
    
    func testEnsureDecodeModel() throws {
        let json = """
        {
            "name": "bulbasaur",
            "order": 1,
            "sprites": {
                "other": {
                    "official-artwork": {
                        "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png"
                    }
                }
            },
            "types": [
                {
                  "slot": 1,
                  "type": {
                    "name": "grass",
                    "url": "https://pokeapi.co/api/v2/type/12/"
                  }
                },
                {
                  "slot": 2,
                  "type": {
                    "name": "poison",
                    "url": "https://pokeapi.co/api/v2/type/4/"
                  }
                }
            ],
            "abilities": [
                {
                  "ability": {
                    "name": "overgrow",
                    "url": "https://pokeapi.co/api/v2/ability/65/"
                  },
                  "is_hidden": false,
                  "slot": 1
                },
                {
                  "ability": {
                    "name": "chlorophyll",
                    "url": "https://pokeapi.co/api/v2/ability/34/"
                  },
                  "is_hidden": true,
                  "slot": 3
                }
              ],
              "weight": 69
        }
        """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        let pokemon = try decoder.decode(Pokemon.self, from: json)
        
        expect(pokemon.sprites.other.officialArtwork.frontDefault.absoluteString) == "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png"
        expect(pokemon.types.count) == 2
        expect(pokemon.types[0].slot) == 1
        expect(pokemon.types[0].type.rawValue) == "grass"
        expect(pokemon.types[1].slot) == 2
        expect(pokemon.types[1].type.rawValue) == "poison"
        expect(pokemon.weight) == 69
        expect(pokemon.abilities.count) == 2
        expect(pokemon.abilities[0].name) == "overgrow"
        expect(pokemon.abilities[0].slot) == 1
        expect(pokemon.abilities[1].name) == "chlorophyll"
        expect(pokemon.abilities[1].slot) == 3
    }
    
}
