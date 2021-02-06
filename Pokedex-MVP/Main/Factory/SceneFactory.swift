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
    
}
