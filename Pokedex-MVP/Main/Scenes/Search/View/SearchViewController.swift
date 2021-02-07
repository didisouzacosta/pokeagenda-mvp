//
//  SearchViewController.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 06/02/21.
//

import Foundation
import UIKit

protocol SearchPresenterView: class {
    func reloadData()
    func showLoading(status: Bool)
    func show(error: Error)
}

final class SearchViewController: UIViewController {
    
    // MARK: - Public Properties
    
    var presenter: SearchViewPresenter!
    
    // MARK: - Private Properties
    
    private var dataSource: TableViewDataSource! {
        didSet {
            dataSource.delegate = self
            tableViewController.tableView.reloadData()
        }
    }
    
    private lazy var tableViewController = UITableViewController(style: .plain)

    private lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: tableViewController)
        searchController.searchBar.placeholder = "Pokemon name"
        searchController.searchBar.searchBarStyle = .minimal
        searchController.definesPresentationContext = true
        searchController.searchResultsUpdater = self
        return searchController
    }()
    
    // MARK: - Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!

    // MARK: - Public Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTitle()
        setupSearch()
        setupDataSource()
        setupSearchTitle()
        setupSearchMessage()
    }
    
    override func viewDidAppear(_ animated: Bool) {
       super.viewDidAppear(animated)
        DispatchQueue.main.async { [weak self] in
            self?.searchController.searchBar.becomeFirstResponder()
        }
   }
    
    // MARK - Private Methods
    
    private func setupTitle() {
        navigationItem.title = "Search"
    }
    
    private func setupSearch() {
        navigationItem.searchController = searchController
    }
    
    private func setupSearchTitle() {
        titleLabel.font = Typography.filterName
        titleLabel.text = "Find your pokemon"
    }
    
    private func setupSearchMessage() {
        messageLabel.font = Typography.description
        messageLabel.text = "Use search to find your favorite pokemon."
    }
    
    private func setupDataSource() {
        dataSource = TableViewDataSource(
            sections: [],
            tableView: tableViewController.tableView
        )
    }
    
}

extension SearchViewController: SearchPresenterView {
    
    func reloadData() {
        let items = presenter.pokemons.map(SearchCellBuilder.init)
        let section = TableViewSection(cellBuilders: items)
        dataSource.sections = [section]
    }
    
    func showLoading(status: Bool) {
        
    }
    
    func show(error: Error) {
//        alert(error: error)
    }
    
}

extension SearchViewController: TableViewDataSourceDelegate {
    
    func didSelect(rowAt indexPath: IndexPath) {
        presenter.didSelect(row: indexPath.row)
    }
    
}

extension SearchViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let term = searchController.searchBar.text else { return }
        presenter.search(term)
    }
    
}
