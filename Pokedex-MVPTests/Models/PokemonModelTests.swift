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
              "weight": 69
        }
        """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        let pokemon = try decoder.decode(Pokemon.self, from: json)
        
        expect(pokemon.sprites.other.officialArtwork.frontDefault.absoluteString) == "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png"
        expect(pokemon.types.count) == 2
        expect(pokemon.types[0].slot) == 1
        expect(pokemon.types[0].type.name) == "grass"
        expect(pokemon.types[1].slot) == 2
        expect(pokemon.types[1].type.name) == "poison"
        expect(pokemon.weight) == 69
    }
    
}
