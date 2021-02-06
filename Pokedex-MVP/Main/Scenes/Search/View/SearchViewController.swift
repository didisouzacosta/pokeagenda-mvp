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
    func update(row: Int)
    func showLoading(status: Bool)
    func show(error: Error)
}

final class SearchViewController: UIViewController {
    
    // MARK: - Public Properties
    
    var presenter: SearchViewPresenter!
    
    // MARK: - Private Properties
    
    private lazy var cancelButton = UIBarButtonItem.init(
        title: "Cancel",
        style: .done,
        target: self,
        action: #selector(cancelTapped)
    )

    private lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "Pokemon name"
        searchController.searchBar.searchBarStyle = .minimal
        searchController.definesPresentationContext = true
        return searchController
    }()

    // MARK: - Public Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTitle()
        setupCancelButton()
        setupSearch()
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
    
    private func setupCancelButton() {
        navigationItem.leftBarButtonItem = cancelButton
    }
    
    private func setupSearch() {
        navigationItem.searchController = searchController
    }
    
    // MARK: Actions
    
    @IBAction private func cancelTapped() {
        presenter.cancelTapped()
    }
    
}

extension SearchViewController: SearchPresenterView {
    
    func reloadData() {
        
    }
    
    func update(row: Int) {
        
    }
    
    func showLoading(status: Bool) {
        
    }
    
    func show(error: Error) {
        alert(error: error)
    }
    
}
