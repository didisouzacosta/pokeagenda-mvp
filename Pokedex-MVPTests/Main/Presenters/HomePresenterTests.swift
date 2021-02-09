//
//  HomePresenterTests.swift
//  Pokedex-MVPTests
//
//  Created by Adriano Souza Costa on 08/02/21.
//

import XCTest
import Nimble

@testable import Pokedex_MVP

class HomePresenterTests: XCTestCase {

    private let url = URL(string: "https://pokemon.com.br")!
    
    func testShouldBeReloadDataIfFetchPokemonsSuccess() throws {
        let fetchPokemonSpy = FetchPokemonSpy()
        let fetchPokemonsSpy = FetchPokemonsSpy()
        let homePresenterViewSpy = HomePresenterViewSpy()
        
        var isReloadDataCalled = false
        var isShowLoadingCalledCount = 0
        
        fetchPokemonsSpy.items = [
            .init(name: "charmander"),
            .init(name: "pikachu")
        ]
        
        homePresenterViewSpy.reloadDataHandler = {
            isReloadDataCalled = true
        }
        
        homePresenterViewSpy.showLoadingHandler = { _ in
            isShowLoadingCalledCount += 1
        }
        
        homePresenterViewSpy.showErrorHandler = { error in
            fail(error.localizedDescription)
        }
        
        let presenter = HomePresenter(
            view: homePresenterViewSpy,
            fetchPokemonsUseCase: fetchPokemonsSpy,
            fetchPokemonUseCase: fetchPokemonSpy
        )
        
        presenter.fetchPokemons()
        
        expect(isReloadDataCalled) == true
        expect(isShowLoadingCalledCount) == 2
    }
    
    func testThrowErrorIfFetchPokemonsFails() throws {
        let fetchPokemonSpy = FetchPokemonSpy()
        let fetchPokemonsSpy = FetchPokemonsSpy()
        let homePresenterViewSpy = HomePresenterViewSpy()
        
        var isReloadDataCalled = false
        var isShowLoadingCalledCount = 0
        
        fetchPokemonsSpy.error = "Simulação de error"
        
        homePresenterViewSpy.reloadDataHandler = {
            isReloadDataCalled = true
        }
        
        homePresenterViewSpy.showLoadingHandler = { _ in
            isShowLoadingCalledCount += 1
        }
        
        homePresenterViewSpy.showErrorHandler = { error in
            expect(error.localizedDescription) == "Simulação de error"
        }
        
        let presenter = HomePresenter(
            view: homePresenterViewSpy,
            fetchPokemonsUseCase: fetchPokemonsSpy,
            fetchPokemonUseCase: fetchPokemonSpy
        )
        
        presenter.fetchPokemons()
        
        expect(isReloadDataCalled) == false
        expect(isShowLoadingCalledCount) == 2
    }
    
    func testShouldBeLoadPokemonIfFetchPokemonSuccess() throws {
        let fetchPokemonSpy = FetchPokemonSpy()
        let fetchPokemonsSpy = FetchPokemonsSpy()
        let homePresenterViewSpy = HomePresenterViewSpy()
        
        var isReloadDataCalledCount = 0
        var isShowLoadingCalledCount = 0
        
        fetchPokemonsSpy.items = [
            .init(name: "charmander"),
            .init(name: "pikachu")
        ]
        
        fetchPokemonSpy.pokemon = Pokemon(
            name: "charmander",
            order: 23,
            weight: 4,
            types: [],
            sprites: .init(other: .init(officialArtwork: .init(frontDefault: url))),
            abilities: [],
            stats: []
        )
        
        homePresenterViewSpy.reloadDataHandler = {
            isReloadDataCalledCount += 1
        }
        
        homePresenterViewSpy.showLoadingHandler = { _ in
            isShowLoadingCalledCount += 1
        }
        
        homePresenterViewSpy.showErrorHandler = { error in
            fail(error.localizedDescription)
        }
        
        let presenter = HomePresenter(
            view: homePresenterViewSpy,
            fetchPokemonsUseCase: fetchPokemonsSpy,
            fetchPokemonUseCase: fetchPokemonSpy
        )
        
        presenter.fetchPokemons()
        presenter.fetchPokemon(at: 0)
        
        expect(isReloadDataCalledCount) == 1
        expect(isShowLoadingCalledCount) == 2
        
        switch presenter.listItems[0].state {
        case .pokemon(let pokemon):
            expect(pokemon.name) == "Charmander"
        default:
            fail()
        }
    }
    
    func testThrowErrorIfLoadPokemonIfFetchPokemonFails() throws {
        let fetchPokemonSpy = FetchPokemonSpy()
        let fetchPokemonsSpy = FetchPokemonsSpy()
        let homePresenterViewSpy = HomePresenterViewSpy()
        
        var isReloadDataCalledCount = 0
        var isShowLoadingCalledCount = 0
        
        fetchPokemonsSpy.items = [
            .init(name: "charmander"),
            .init(name: "pikachu")
        ]
        
        fetchPokemonSpy.error = "Simulação de erro"
        
        homePresenterViewSpy.reloadDataHandler = {
            isReloadDataCalledCount += 1
        }
        
        homePresenterViewSpy.showLoadingHandler = { _ in
            isShowLoadingCalledCount += 1
        }
        
        homePresenterViewSpy.showErrorHandler = { error in
            fail(error.localizedDescription)
        }
        
        let presenter = HomePresenter(
            view: homePresenterViewSpy,
            fetchPokemonsUseCase: fetchPokemonsSpy,
            fetchPokemonUseCase: fetchPokemonSpy
        )
        
        presenter.fetchPokemons()
        presenter.fetchPokemon(at: 0)
        
        expect(isReloadDataCalledCount) == 1
        expect(isShowLoadingCalledCount) == 2
        
        switch presenter.listItems[0].state {
        case .error(let error):
            expect(error.localizedDescription) == "Simulação de erro"
        default:
            fail()
        }
    }

}

fileprivate class HomePresenterViewSpy: HomePresenterView {
    
    var reloadDataHandler: (() -> Void)?
    var updateHandler: ((Int) -> Void)?
    var showLoadingHandler: ((Bool) -> Void)?
    var showErrorHandler: ((Error) -> Void)?
    
    func reloadData() {
        reloadDataHandler?()
    }
    
    func update(row: Int) {
        updateHandler?(row)
    }
    
    func showLoading(status: Bool) {
        showLoadingHandler?(status)
    }
    
    func show(error: Error) {
        showErrorHandler?(error)
    }
    
}
