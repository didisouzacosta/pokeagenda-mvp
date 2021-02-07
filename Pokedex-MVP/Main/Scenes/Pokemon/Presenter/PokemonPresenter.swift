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
    
    // MARK: - Public Properties
    
    private(set) var pokemon: PokemonViewModel? {
        didSet {
            guard let pokemon = pokemon else { return }
            view?.setup(with: pokemon)
        }
    }
    
    // MARK: - Private Properties
    
    private let fetchPokemonUseCase: FetchPokemonUseCase
    
    private weak var view: PokemonPresenterView?
    
    private var _pokemon: Pokemon? {
        didSet {
            guard let _pokemon = _pokemon else { return }
            pokemon = .init(_pokemon)
        }
    }
    
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
                self?._pokemon = try response.get()
            } catch {
                self?.view?.show(error: error)
            }
            
            self?.isLoading = false
        }
    }
    
}
