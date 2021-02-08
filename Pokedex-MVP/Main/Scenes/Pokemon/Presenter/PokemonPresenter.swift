//
//  PokemonPresenter.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 07/02/21.
//

import Foundation

protocol PokemonViewPresenter {
    func fetchPokemon()
}

class PokemonPresenter {
    
    // MARK: - Private Properties
    
    private let fetchPokemonUseCase: FetchPokemonUseCase
    private let identifier: PokemonIndentifier
    
    private weak var view: PokemonPresenterView?
    
    private var isLoading = false {
        didSet { view?.showLoading(status: isLoading) }
    }
    
    // MARK: Public Methods
    
    init(
        view: PokemonPresenterView,
        fetchPokemonUseCase: FetchPokemonUseCase,
        pokemon identifier: PokemonIndentifier
    ) {
        self.view = view
        self.fetchPokemonUseCase = fetchPokemonUseCase
        self.identifier = identifier
    }
    
}

extension PokemonPresenter: PokemonViewPresenter {
    
    func fetchPokemon() {
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
