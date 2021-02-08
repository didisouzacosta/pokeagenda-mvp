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
    func show(pokemon identifier: PokemonIndentifier)
}

class SearchPresenter {
    
    // MARK: - Public Properties
    
    var delegate: SearchViewPresenterDelegate?
    
    // MARK: - Private Properties
    
    private let fetchPokemonUseCase: FetchPokemonUseCaseProtocol
    
    private var currentTerm: String?
    
    private weak var view: SearchPresenterView?
    
    private var isLoading = false {
        didSet {
            guard oldValue != isLoading else { return }
            
            if isLoading {
                view?.noHaveResults(status: false, term: nil)
            }
            
            view?.showLoading(status: isLoading)
        }
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
        if pokemon.count < FetchPokemonUseCase.minNameLength {
            isLoading = false
            view?.noHaveResults(status: false, term: nil)
            return
        }
        
        isLoading = true
        currentTerm = pokemon
        
        fetchPokemonUseCase.execute(pokemon) { [weak self] response in
            guard pokemon == self?.currentTerm else { return }
            
            if let pokemon = try? response.get() {
                self?._pokemons = [pokemon]
                self?.view?.noHaveResults(status: false, term: nil)
            } else {
                self?._pokemons.removeAll()
                self?.view?.noHaveResults(status: true, term: pokemon)
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
        delegate?.show(pokemon: pokemons[row].name)
    }
    
}
