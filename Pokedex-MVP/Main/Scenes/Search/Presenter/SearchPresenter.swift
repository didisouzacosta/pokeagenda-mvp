//
//  SearchPresenter.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 06/02/21.
//

import Foundation

protocol SearchViewPresenter {
    var listItems: [HomeListItem] { get }
    
    func fetchPokemon(at row: Int)
    func retryFetchPokemon(with row: Int)
    func didSelect(row: Int)
    func cancelTapped()
}

protocol SearchViewPresenterDelegate: class {
    func cancel()
    func show(_ pokemon: PokemonIndentifier)
}

class SearchPresenter {
    
    // MARK: - Public Properties
    
    var delegate: SearchViewPresenterDelegate?
    
    // MARK: - Private Properties
    
    private weak var view: SearchPresenterView?
    
    // MARK: - Public Methods
    
    init(view: SearchPresenterView) {
        self.view = view
    }
    
}

extension SearchPresenter: SearchViewPresenter {
    
    var listItems: [HomeListItem] {
        return []
    }
    
    func fetchPokemon(at row: Int) {}
    
    func retryFetchPokemon(with row: Int) {}
    
    func didSelect(row: Int) {
        delegate?.show("bulbasour")
    }
    
    func cancelTapped() {
        delegate?.cancel()
    }
    
}
