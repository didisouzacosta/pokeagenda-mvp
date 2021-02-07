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
}

final class SearchViewController: UIViewController {
    
    // MARK: - Public Properties
    
    var presenter: SearchViewPresenter!
    
    // MARK: - Private Properties
    
    private lazy var dataSource: TableViewDataSource = {
        let dataSource = TableViewDataSource(sections: [], tableView: tableView)
        dataSource.delegate = self
        return dataSource
    }()
    
    private lazy var searchInputView: SearchInputView = {
        let input = SearchInputView()
        input.delegate = self
        input.placeholder = "What Pokemon are you looking for?"
        return input
    }()
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var extraHeaderContentStack: UIStackView!

    // MARK: - Public Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTitle()
        setupSearchInputView()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
       super.viewDidAppear(animated)
        searchInputView.becomeFirstResponder()
   }
    
    // MARK - Private Methods
    
    private func setupTitle() {
        navigationItem.title = "Search"
    }
    
    private func setupSearchInputView() {
        extraHeaderContentStack.addArrangedSubview(searchInputView)
    }
    
    private func setupTableView() {
        tableView.tableFooterView = .tableFooterView
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
    
}

extension SearchViewController: TableViewDataSourceDelegate {
    
    func didSelect(rowAt indexPath: IndexPath) {
        presenter.didSelect(row: indexPath.row)
    }
    
}

extension SearchViewController: SearchInputViewDelegate {
    
    func textDidChange(text: String?) {
        guard let term = text else { return }
        presenter.search(term)
    }
    
}
