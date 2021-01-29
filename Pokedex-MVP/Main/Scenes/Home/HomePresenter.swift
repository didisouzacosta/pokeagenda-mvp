//
//  HomePresenter.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 28/01/21.
//

import Foundation

protocol HomeViewPresenter {
    var items: [PaginationResultItem] { get }
    
    func fetchPokemons()
    func fetchPokemon(_ name: String)
    func loadNextPage()
    
    func generationsButtonTapped()
    func sortButtonTapped()
    func filterButtonTapped()
    func searchViewTapped()
}

class HomePresenter {
    
    // MARK: Private Properties
    
    private let fetchPokemonsUseCase: FetchPokemonsUseCaseProtocol
    private let fetchPokemonUseCase: FetchPokemonUseCaseProtocol
    
    private weak var view: HomePresenterView?
    private var page = 1
    private var _items: [PaginationResultItem] = []
    
    private var isLoading = false {
        didSet { view?.showLoading(status: isLoading) }
    }
    
    private var error: Error? {
        didSet {
            guard let error = error else { return }
            view?.show(error: error)
        }
    }
    
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
    
    var items: [PaginationResultItem] {
        return _items
    }
    
    func fetchPokemons() {
        isLoading = true
        
        fetchPokemonsUseCase.execute(page: page) { [weak self] response in
            do {
                self?._items = try response.get()
            } catch {
                self?.error = error
            }
            
            self?.isLoading = false
        }
    }
    
    func fetchPokemon(_ name: String) {}
    
    func searchViewTapped() {}
    
    func generationsButtonTapped() {
        view?.showGenerations()
    }
    
    func sortButtonTapped() {
        view?.showSort()
    }
    
    func filterButtonTapped() {
        view?.showFilter()
    }
    
    func loadNextPage() {}
    
}
