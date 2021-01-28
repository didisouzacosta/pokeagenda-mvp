//
//  HomePresenter.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 28/01/21.
//

import Foundation

protocol HomeViewPresenter {
    func generationsButtonTapped()
    func sortButtonTapped()
    func filterButtonTapped()
}

class HomePresenter {
    
    // MARK: Private Properties
    
    private let fetchPokemonsUseCase: FetchPokemonsUseCaseProtocol
    private let fetchPokemonUseCase: FetchPokemonUseCaseProtocol
    
    private weak var view: HomePresenterView?
    
    // MARK: Public Methods
    
    init(
        view: HomePresenterView,
        fetchPokemonsUseCase: FetchPokemonsUseCaseProtocol,
        fetchPokemonUseCase: FetchPokemonUseCaseProtocol
    ) {
        self.view = view
        self.fetchPokemonsUseCase = fetchPokemonsUseCase
        self.fetchPokemonUseCase = fetchPokemonUseCase
    }
    
}

extension HomePresenter: HomeViewPresenter {
    
    func generationsButtonTapped() {
        view?.showGenerations()
    }
    
    func sortButtonTapped() {
        view?.showSort()
    }
    
    func filterButtonTapped() {
        view?.showFilter()
    }
    
}
