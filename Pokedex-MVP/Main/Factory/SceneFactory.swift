//
//  SceneFactory.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 28/01/21.
//

import Foundation

class SceneFactory {
    
    // MARK: - Private Properties
    
    private static let fetchPokemonUseCase = UseCaseFactory.makeFetchPokemonUseCase()
    private static let fetchPokemonsUseCase = UseCaseFactory.makeFetchPokemonsUseCase()
    
    static func makeHomeScene(delegate: HomeViewPresenterDelegate?) -> HomeViewController {
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
        let view = SearchViewController()
        
        let presenter = SearchPresenter(
            view: view,
            fetchPokemonUseCase: fetchPokemonUseCase
        )
        
        presenter.delegate = delegate
        
        view.presenter = presenter
        
        return view
    }
    
    static func makePokemonScene(pokemon identifier: PokemonIndentifier) -> PokemonViewController {
        let view = PokemonViewController()
        
        let presenter = PokemonPresenter(
            view: view,
            fetchPokemonUseCase: fetchPokemonUseCase,
            pokemon: identifier
        )

        view.presenter = presenter
        
        return view
    }
    
    static func makeFilterScene() -> FilterViewController {
        return FilterViewController()
    }
    
    static func makeGenerationsScene() -> GenerationsViewController {
        return GenerationsViewController()
    }
    
    static func makeSortScene() -> SortViewController {
        return SortViewController()
    }
    
}
