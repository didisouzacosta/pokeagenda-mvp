//
//  SearchPresenterTests.swift
//  Pokedex-MVPTests
//
//  Created by Adriano Souza Costa on 08/02/21.
//

import XCTest
import Nimble
import UIKit

@testable import Pokedex_MVP

class SearchPresenterTests: XCTestCase {

    private let url = URL(string: "https://pokemon.com.br")!
    
    func testSearchPokemonIfSearchSuccess() throws {
        let fetchPokemonSpy = FetchPokemonSpy()
        let searchPresenterViewSpy = SearchPresenterViewSpy()
        
        var isReloadDataCalled = false
        var isShowLoadingCalledCount = 0
        
        fetchPokemonSpy.pokemon = Pokemon(
            name: "charmander",
            order: 23,
            weight: 4,
            types: [],
            sprites: .init(other: .init(officialArtwork: .init(frontDefault: url))),
            abilities: [],
            stats: []
        )
        
        searchPresenterViewSpy.reloadDataHandler = {
            isReloadDataCalled = true
        }
        
        searchPresenterViewSpy.showLoadingHandler = { _ in
            isShowLoadingCalledCount += 1
        }
        
        searchPresenterViewSpy.noHaveResultsHandler = { status, _ in
            guard status else { return }
            fail()
        }
        
        let presenter = SearchPresenter(
            view: searchPresenterViewSpy,
            fetchPokemonUseCase: fetchPokemonSpy
        )
        
        presenter.search("charmander")
        
        expect(isReloadDataCalled) == true
        expect(isShowLoadingCalledCount) == 2
        expect(presenter.pokemons.count) == 1
        expect(presenter.pokemons[0].name) == "Charmander"
    }

}

fileprivate class SearchPresenterViewSpy: SearchPresenterView {
    
    var reloadDataHandler: (() -> Void)?
    var showLoadingHandler: ((Bool) -> Void)?
    var noHaveResultsHandler: ((Bool, String?) -> Void)?
    
    func reloadData() {
        reloadDataHandler?()
    }
    
    func showLoading(status: Bool) {
        showLoadingHandler?(status)
    }
    
    func noHaveResults(status: Bool, term: String?) {
        noHaveResultsHandler?(status, term)
    }
    
}
