//
//  SearchPresenter.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 06/02/21.
//

import Foundation

protocol SearchViewPresenter {
    var pokemons: [PokemonViewModel] { get }
    
    func search(_ pokemon: PokemonIndentifier)
    func didSelect(row: Int)
}

protocol SearchViewPresenterDelegate: class {
    func show(_ pokemon: PokemonIndentifier)
}

class SearchPresenter {
    
    // MARK: - Public Properties
    
    var delegate: SearchViewPresenterDelegate?
    
    // MARK: - Private Properties
    
    private let fetchPokemonUseCase: FetchPokemonUseCaseProtocol
    
    private weak var view: SearchPresenterView?
    
    private var isLoading = false {
        didSet { view?.showLoading(status: isLoading) }
    }
    
    private var _pokemons: [Pokemon] = [] {
        didSet { view?.reloadData() }
    }
    
    // MARK: - Public Methods
    
    init(
        view: SearchPresenterView,
        fetchPokemonUseCase: FetchPokemonUseCaseProtocol
    ) {
        self.view = view
        self.fetchPokemonUseCase = fetchPokemonUseCase
    }
    
    func search(_ pokemon: PokemonIndentifier) {
        view?.showLoading(status: true)
        _pokemons.removeAll()
        
        isLoading = true
        
        fetchPokemonUseCase.execute(pokemon) { [weak self] response in
            if let pokemon = try? response.get() {
                self?._pokemons = [pokemon]
            }
            
            self?.isLoading = false
        }
    }
    
}

extension SearchPresenter: SearchViewPresenter {
    
    var pokemons: [PokemonViewModel] {
        return _pokemons.map(PokemonViewModel.init)
    }
    
    func didSelect(row: Int) {
        delegate?.show(pokemons[row].name)
    }
    
}
