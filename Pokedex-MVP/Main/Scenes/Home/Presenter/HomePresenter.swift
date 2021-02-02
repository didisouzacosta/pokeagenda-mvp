//
//  HomePresenter.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 28/01/21.
//

import Foundation

enum HomeListItemState {
    case pokemon(PokemonViewModel)
    case error(Error)
    case isLoading
}

struct HomeListItem {
    let state: HomeListItemState
}

protocol HomeViewPresenter {
    var listItems: [HomeListItem] { get }
    
    func fetchPokemons()
    func loadNextPage()
    func didSelect(row: Int)
    func willDisplay(row: Int)
    func generationsButtonTapped()
    func sortButtonTapped()
    func filterButtonTapped()
    func searchViewTapped()
    func retryFetchPokemon(with row: Int)
}

class HomePresenter {
    
    // MARK: Private Properties
    
    private let fetchPokemonsUseCase: FetchPokemonsUseCaseProtocol
    private let fetchPokemonUseCase: FetchPokemonUseCaseProtocol
    
    private weak var view: HomePresenterView?
    private var fetchingPokemonsList: [String] = []
    private var page = 1
    
    private var _listItems: [HomeListItem] = [] {
        didSet { view?.reloadData() }
    }
    
    private var paginationItems: [PaginationResultItem] = [] {
        didSet {
            _listItems = paginationItems.map { _ in
                .init(state: .isLoading)
            }
        }
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
    
    // MARK: - Public Methods
    
    init(
        view: HomePresenterView,
        fetchPokemonsUseCase: FetchPokemonsUseCaseProtocol,
        fetchPokemonUseCase: FetchPokemonUseCaseProtocol
    ) {
        self.view = view
        self.fetchPokemonsUseCase = fetchPokemonsUseCase
        self.fetchPokemonUseCase = fetchPokemonUseCase
    }
    
    func retryFetchPokemon(with row: Int) {
        fetchPokemon(with: paginationItems[row])
    }
    
    // MARK: - Private Methods
    
    private func fetchPokemon(with item: PaginationResultItem) {
        guard let index = paginationItems.firstIndex(where: { (paginationItem) -> Bool in
            return paginationItem == item
        }) else { return }
        
        let homeListItem = _listItems[index]
        
        guard case .isLoading = homeListItem.state else { return }
        
        guard !fetchingPokemonsList.contains(item.name) else { return }
        
        fetchingPokemonsList.append(item.name)
        
        fetchPokemonUseCase.execute(item.name) { [weak self] response in
            self?.fetchingPokemonsList.removeAll { $0 == item.name }
            
            do {
                let pokemon = try response.get()
                self?._listItems[index] = .init(state: .pokemon(.init(pokemon)))
            } catch {
                self?._listItems[index] = .init(state: .error(error))
            }
        }
    }
    
}

extension HomePresenter: HomeViewPresenter {
    
    var listItems: [HomeListItem] {
        return _listItems
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
    
    func searchViewTapped() {
        
    }
    
    func didSelect(row: Int) {
        print(row)
    }
    
    func willDisplay(row: Int) {
        fetchPokemon(with: paginationItems[row])
    }
    
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
