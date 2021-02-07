//
//  SceneFactory.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 28/01/21.
//

import Foundation

class SceneFactory {
    
    static func makeHomeScene(delegate: HomeViewPresenterDelegate?) -> HomeViewController {
        let fetchPokemonUseCase = UseCaseFactory.makeFetchPokemonUseCase()
        let fetchPokemonsUseCase = UseCaseFactory.makeFetchPokemonsUseCase()
        
        let view = HomeViewController()
        
        let presenter = HomePresenter(
            view: view,
            fetchPokemonsUseCase: fetchPokemonsUseCase,
            fetchPokemonUseCase: fetchPokemonUseCase
        )
        
        presenter.delegate = delegate
        
        view.presenter = presenter
        
        return view
    }
    
    static func makeSearchScene(delegate: SearchViewPresenterDelegate) -> SearchViewController {
        let fetchPokemonUseCase = UseCaseFactory.makeFetchPokemonUseCase()
        
        let view = SearchViewController()
        
        let presenter = SearchPresenter(
            view: view,
            fetchPokemonUseCase: fetchPokemonUseCase
        )
        
        presenter.delegate = delegate
        
        view.presenter = presenter
        
        return view
    }
    
    static func makeFilterScene() -> FilterViewController {
//        let fetchPokemonUseCase = UseCaseFactory.makeFetchPokemonUseCase()
//        let fetchPokemonsUseCase = UseCaseFactory.makeFetchPokemonsUseCase()
        
        let view = FilterViewController()
        
//        let presenter = HomePresenter(
//            view: view,
//            fetchPokemonsUseCase: fetchPokemonsUseCase,
//            fetchPokemonUseCase: fetchPokemonUseCase
//        )
//
//        presenter.delegate = delegate
//
//        view.presenter = presenter
        
        return view
    }
    
    static func makeGenerationsScene() -> GenerationsViewController {
//        let fetchPokemonUseCase = UseCaseFactory.makeFetchPokemonUseCase()
//        let fetchPokemonsUseCase = UseCaseFactory.makeFetchPokemonsUseCase()
        
        let view = GenerationsViewController()
        
//        let presenter = HomePresenter(
//            view: view,
//            fetchPokemonsUseCase: fetchPokemonsUseCase,
//            fetchPokemonUseCase: fetchPokemonUseCase
//        )
//
//        presenter.delegate = delegate
//
//        view.presenter = presenter
        
        return view
    }
    
    static func makeSortScene() -> SortViewController {
//        let fetchPokemonUseCase = UseCaseFactory.makeFetchPokemonUseCase()
//        let fetchPokemonsUseCase = UseCaseFactory.makeFetchPokemonsUseCase()
        
        let view = SortViewController()
        
//        let presenter = HomePresenter(
//            view: view,
//            fetchPokemonsUseCase: fetchPokemonsUseCase,
//            fetchPokemonUseCase: fetchPokemonUseCase
//        )
//
//        presenter.delegate = delegate
//
//        view.presenter = presenter
        
        return view
    }
    
    static func makePokemonScene() -> PokemonViewController {
        let fetchPokemonUseCase = UseCaseFactory.makeFetchPokemonUseCase()
        
        let view = PokemonViewController()
        
        let presenter = PokemonPresenter(
            view: view,
            fetchPokemonUseCase: fetchPokemonUseCase
        )

        view.presenter = presenter
        
        return view
    }
    
}
