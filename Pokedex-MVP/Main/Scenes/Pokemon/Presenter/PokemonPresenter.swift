//
//  PokemonPresenter.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 07/02/21.
//

import Foundation

protocol PokemonViewPresenter {
    func fetchPokemon(with identifier: PokemonIndentifier)
}

class PokemonPresenter {
    
    // MARK: - Private Properties
    
    private let fetchPokemonUseCase: FetchPokemonUseCase
    
    private weak var view: PokemonPresenterView?
    
    private var isLoading = false {
        didSet { view?.showLoading(status: isLoading) }
    }
    
    // MARK: Public Methods
    
    init(
        view: PokemonPresenterView,
        fetchPokemonUseCase: FetchPokemonUseCase
    ) {
        self.view = view
        self.fetchPokemonUseCase = fetchPokemonUseCase
    }
    
}

extension PokemonPresenter: PokemonViewPresenter {
    
    func fetchPokemon(with identifier: PokemonIndentifier) {
        isLoading = true
        
        fetchPokemonUseCase.execute(identifier) { [weak self] response in
            do {
                let pokemon = try response.get()
                self?.view?.setup(with: .init(pokemon))
            } catch {
                self?.view?.show(error: error)
            }
            
            self?.isLoading = false
        }
    }
    
}
