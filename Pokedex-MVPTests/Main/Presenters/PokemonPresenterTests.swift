//
//  PokemonPresenterTests.swift
//  Pokedex-MVPTests
//
//  Created by Adriano Souza Costa on 08/02/21.
//

import XCTest
import Nimble

@testable import Pokedex_MVP

class PokemonPresenterTests: XCTestCase {

    private let url = URL(string: "https://pokemon.com.br")!
    
    func testDisplayPokemonInfosIfSearchSuccess() throws {
        let fetchPokemonSpy = FetchPokemonSpy()
        let pokemonPresenterViewSpy = PokemonPresenterViewSpy()
        
        fetchPokemonSpy.pokemon = Pokemon(
            name: "charmander",
            order: 23,
            weight: 4,
            types: [],
            sprites: .init(other: .init(officialArtwork: .init(frontDefault: url))),
            abilities: [],
            stats: []
        )
        
        pokemonPresenterViewSpy.setupHandler = { pokemon in
            expect(pokemon.name) == "Charmander"
        }
        
        pokemonPresenterViewSpy.showErrorHandler = { _ in
            fail()
        }
        
        let presenter = PokemonPresenter(
            view: pokemonPresenterViewSpy,
            fetchPokemonUseCase: fetchPokemonSpy,
            pokemon: "charmander"
        )
        
        presenter.fetchPokemon()
    }
    
    func testThrowErrorIfSearchFails() throws {
        let fetchPokemonSpy = FetchPokemonSpy()
        let pokemonPresenterViewSpy = PokemonPresenterViewSpy()
        
        fetchPokemonSpy.error = "Simulação de error"
        
        pokemonPresenterViewSpy.setupHandler = { pokemon in
            fail()
        }
        
        pokemonPresenterViewSpy.showErrorHandler = { error in
            expect(error.localizedDescription) == "Simulação de error"
        }
        
        let presenter = PokemonPresenter(
            view: pokemonPresenterViewSpy,
            fetchPokemonUseCase: fetchPokemonSpy,
            pokemon: "charmander"
        )
        
        presenter.fetchPokemon()
    }

}

fileprivate class PokemonPresenterViewSpy: PokemonPresenterView {
    
    var setupHandler: ((PokemonViewModel) -> Void)?
    var showErrorHandler: ((Error) -> Void)?
    var showLoadingHandler: ((Bool) -> Void)?
    
    func show(error: Error) {
        showErrorHandler?(error)
    }
    
    func setup(with pokemon: PokemonViewModel) {
        setupHandler?(pokemon)
    }
    
    func showLoading(status: Bool) {
        showLoadingHandler?(status)
    }
    
}
