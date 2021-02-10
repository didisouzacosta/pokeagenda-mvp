//
//  Strings.swift
//  Pokedex-MVPTests
//
//  Created by Adriano Souza Costa on 08/02/21.
//

import XCTest
import Nimble

@testable import Pokedex_MVP

class Strings: XCTestCase {

    func testEnsureGenrealLocalizableStrings() throws {
        expect("pokedex".localized) == "Pokédex"
        expect("search-placeholder".localized) == "What Pokémon are you looking for?"
        expect("loading".localized) == "Loading..."
        expect("no-results".localized(arguments: "char")) == "No results were found to char"
    }
    
    func testEnsureHomeLocalizableStrings() throws {
        expect("home-description".localized) == "Search for Pokémon by name or using the National Pokédex number."
    }
    
    func testEnsureSearchLocalizableStrings() throws {
        expect("search-title".localized) == "Search"
    }
    
    func testEnsureSectionsLocalizableStrings() throws {
        expect("stats".localized) == "Stats"
        expect("abilities".localized) == "Abilities"
    }
    
    func testEnsurePokemonDetailsLocalizableStrings() throws {
        expect("hp".localized) == "HP"
        expect("attack".localized) == "Attack"
        expect("defense".localized) == "Defense"
        expect("special-attack".localized) == "Special Attack"
        expect("special-defense".localized) == "Special Defense"
        expect("speed".localized) == "Speed"
    }
    
    func testEnsurePokemonTypeLocalizableStrings() throws {
        expect("bug".localized) == "Bug";
        expect("dark".localized) == "Dark";
        expect("dragon".localized) == "Dragon";
        expect("electric".localized) == "Eletric";
        expect("fairy".localized) == "Fairy";
        expect("fighting".localized) == "Fighting";
        expect("fire".localized) == "Fire";
        expect("flying".localized) == "Flying";
        expect("ghost".localized) == "Ghost";
        expect("grass".localized) == "Grass";
        expect("ground".localized) == "Ground";
        expect("ice".localized) == "Ice";
        expect("normal".localized) == "Normal";
        expect("poison".localized) == "Poison";
        expect("psychic".localized) == "Psychic";
        expect("rock".localized) == "Rock";
        expect("steel".localized) == "Steel";
        expect("water".localized) == "Water";
        expect("unknown".localized) == "Unknown";
    }

}
