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
            "stats": [
                {
                  "base_stat": 48,
                  "effort": 1,
                  "stat": {
                    "name": "hp",
                    "url": "https://pokeapi.co/api/v2/stat/1/"
                  }
                },
                {
                  "base_stat": 48,
                  "effort": 0,
                  "stat": {
                    "name": "attack",
                    "url": "https://pokeapi.co/api/v2/stat/2/"
                  }
                },
                {
                  "base_stat": 48,
                  "effort": 0,
                  "stat": {
                    "name": "defense",
                    "url": "https://pokeapi.co/api/v2/stat/3/"
                  }
                },
                {
                  "base_stat": 48,
                  "effort": 0,
                  "stat": {
                    "name": "special-attack",
                    "url": "https://pokeapi.co/api/v2/stat/4/"
                  }
                },
                {
                  "base_stat": 48,
                  "effort": 0,
                  "stat": {
                    "name": "special-defense",
                    "url": "https://pokeapi.co/api/v2/stat/5/"
                  }
                },
                {
                  "base_stat": 48,
                  "effort": 0,
                  "stat": {
                    "name": "speed",
                    "url": "https://pokeapi.co/api/v2/stat/6/"
                  }
                }
              ],
              "weight": 69
        }
        """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        let pokemon = try decoder.decode(Pokemon.self, from: json)
        
        expect(pokemon.sprites.other.officialArtwork.frontDefault.absoluteString) == "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png"
        
        expect(pokemon.name) == "bulbasaur"
        expect(pokemon.order) == 1
        expect(pokemon.weight) == 69
        
        expect(pokemon.types.count) == 2
        expect(pokemon.types[0].slot) == 1
        expect(pokemon.types[0].type.rawValue) == "grass"
        expect(pokemon.types[1].slot) == 2
        expect(pokemon.types[1].type.rawValue) == "poison"
        
        expect(pokemon.abilities.count) == 2
        expect(pokemon.abilities[0].name) == "overgrow"
        expect(pokemon.abilities[0].slot) == 1
        expect(pokemon.abilities[1].name) == "chlorophyll"
        expect(pokemon.abilities[1].slot) == 3
        
        expect(pokemon.stats.count) == 6
        expect(pokemon.stats[0].name) == "hp"
        expect(pokemon.stats[0].value) == 48
        
        expect(pokemon.stats[1].name) == "attack"
        expect(pokemon.stats[1].value) == 48
        
        expect(pokemon.stats[2].name) == "defense"
        expect(pokemon.stats[2].value) == 48
        
        expect(pokemon.stats[3].name) == "special-attack"
        expect(pokemon.stats[3].value) == 48
        
        expect(pokemon.stats[4].name) == "special-defense"
        expect(pokemon.stats[4].value) == 48
        
        expect(pokemon.stats[5].name) == "speed"
        expect(pokemon.stats[5].value) == 48
    }
    
}
