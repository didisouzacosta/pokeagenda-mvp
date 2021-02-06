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
    func fetchPokemon(at row: Int)
    func loadNextPage()
    func didSelect(row: Int)
    func generationsButtonTapped()
    func sortButtonTapped()
    func filterButtonTapped()
    func searchViewTapped()
    func retryFetchPokemon(with row: Int)
}

protocol HomeViewPresenterDelegate: class {
    func showFilter()
    func showGenerations()
    func showSort()
    func showSearch()
    func show(_ pokemon: PokemonIndentifier)
}

class HomePresenter {
    
    // MARK: Public Properties
    
    weak var delegate: HomeViewPresenterDelegate?
    
    // MARK: Private Properties
    
    private let fetchPokemonsUseCase: FetchPokemonsUseCaseProtocol
    private let fetchPokemonUseCase: FetchPokemonUseCaseProtocol
    
    private weak var view: HomePresenterView?
    private var fetchingPokemonsList: [String] = []
    private var paginationIsEnded = false
    private var page = 1
    
    private var _listItems: [HomeListItem] = []
    
    private var paginationItems: [PaginationResultItem] = [] {
        didSet {
            let start = oldValue.count
            let limit = paginationItems.count - 1
            let newItems = paginationItems[start...limit]
            _listItems += newItems.map { _ in .init(state: .isLoading) }
            view?.reloadData()
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
            
            self?.view?.update(row: index)
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
                let newItems = try response.get()
                
                if newItems.isEmpty {
                    self?.paginationIsEnded = true
                } else {
                    self?.paginationItems += newItems
                }
            } catch {
                self?.error = error
            }
            
            self?.isLoading = false
        }
    }
    
    func searchViewTapped() {
        delegate?.showSearch()
    }
    
    func didSelect(row: Int) {
        let item = paginationItems[row]
        delegate?.show(item.name)
    }
    
    func fetchPokemon(at row: Int) {
        fetchPokemon(with: paginationItems[row])
    }
    
    func generationsButtonTapped() {
        delegate?.showGenerations()
    }
    
    func sortButtonTapped() {
        delegate?.showSort()
    }
    
    func filterButtonTapped() {
        delegate?.showFilter()
    }
    
    func loadNextPage() {
        guard !isLoading else { return }
        guard !listItems.isEmpty else { return }
        guard !paginationIsEnded else { return }
        
        page += 1
        fetchPokemons()
    }
    
}
