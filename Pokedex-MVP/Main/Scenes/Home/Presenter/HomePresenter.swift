//
//  HomePresenter.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 28/01/21.
//

import Foundation

enum HomeListItemState {
    case pokemon(Pokemon)
    case error(Error)
    case isLoading(Bool)
}

struct HomeListItem {
    let state: HomeListItemState
}

protocol HomeViewPresenter {
    var items: [HomeListItem] { get }
    
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
    
    private var paginationItems: [PaginationResultItem] = [] {
        didSet { view?.reloadData() }
    }
    
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
    
    var items: [HomeListItem] {
        return paginationItems.map { item in
            return .init(state: .isLoading(true))
        }
    }
    
    func fetchPokemons() {
        isLoading = true
        
        fetchPokemonsUseCase.execute(page: page) { [weak self] response in
            do {
                self?.paginationItems = try response.get()
            } catch {
                self?.error = error
            }
            
            self?.isLoading = false
        }
    }
    
    func fetchPokemon(_ name: String) {
        
    }
    
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
