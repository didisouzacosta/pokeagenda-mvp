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
    func noHaveResults(status: Bool, term: String?)
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
        input.placeholder = "search-placeholder".localized
        return input
    }()
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadStatusLabel: UILabel!
    @IBOutlet weak var noResultsFoundLabel: UILabel!
    @IBOutlet weak var extraHeaderContentStack: UIStackView!

    // MARK: - Public Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTitle()
        setupSearchInputView()
        setupTableView()
        setupLoadStatus()
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
        navigationItem.title = "search-title".localized
    }
    
    private func setupSearchInputView() {
        extraHeaderContentStack.addArrangedSubview(searchInputView)
    }
    
    private func setupTableView() {
        tableView.tableFooterView = .tableFooterView
    }
    
    private func setupLoadStatus() {
        loadStatusLabel.text = "loading".localized
    }
    
}

extension SearchViewController: SearchPresenterView {
    
    func reloadData() {
        let items = presenter.pokemons.map(SearchCellBuilder.init)
        let section = TableViewSection(cellBuilders: items)
        dataSource.sections = [section]
    }
    
    func showLoading(status: Bool) {
        loadStatusLabel.isHidden = !status
    }
    
    func noHaveResults(status: Bool, term: String?) {
        noResultsFoundLabel.isHidden = !status
        noResultsFoundLabel.text = "no-results".localized(arguments: term ?? "current term")
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
