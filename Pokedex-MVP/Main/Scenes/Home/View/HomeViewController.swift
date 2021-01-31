//
//  HomeViewController.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 21/01/21.
//

import UIKit

protocol HomePresenterView: class {
    func reloadData()
    func showLoading(status: Bool)
    func show(error: Error)
    func showFilter()
    func showGenerations()
    func showSort()
}

class HomeViewController: UIViewController {

    // MARK: - Public Properties
    
    var presenter: HomeViewPresenter!
    
    // MARK: - Private Properties
    
    private var dataSource: TableViewDataSource! {
        didSet {
            dataSource.delegate = self
            tableView.reloadData()
        }
    }
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loaderView: UIActivityIndicatorView!
    
    // MARK: - Public Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // MARK: - Private Methods
    
    private func setupView() {}
    
    private func setupDataSource() {
        let itemsBuilders = presenter.listItems.map(HomeListItemCellBuilder.init)
        let section = TableViewSection(cellBuilders: itemsBuilders)
        
        dataSource = TableViewDataSource(
            sections: [section],
            tableView: tableView
        )
    }
    
    private func fetchData() {
        presenter.fetchPokemons()
    }
    
    // MARK: - Actions
    
    @IBAction func fetchPokemonsTapped() {
        presenter.fetchPokemons()
    }
    
    @IBAction func showGenerationsTapped() {
        presenter.generationsButtonTapped()
    }
    
    @IBAction func showSortTapped() {
        presenter.sortButtonTapped()
    }
    
    @IBAction func showFilterTapped() {
        presenter.filterButtonTapped()
    }

}

extension HomeViewController: HomePresenterView {
    
    func reloadData() {
        setupDataSource()
    }
    
    func showLoading(status: Bool) {
        status ? loaderView.startAnimating() : loaderView.stopAnimating()
    }
    
    func show(error: Error) {
        alert(error: error)
    }
    
    func showFilter() {
        print("Exibir controle")
    }
    
    func showGenerations() {
        print("Exibir generations")
    }
    
    func showSort() {
        print("Exibir sort")
    }
    
}

extension HomeViewController: TableViewDataSourceDelegate {
    
    func didSelect(rowAt indexPath: IndexPath) {
        presenter.didSelect(row: indexPath.row)
    }
    
    func willDisplay(rowAt indexPath: IndexPath) {
        presenter.willDisplay(row: indexPath.row)
    }
    
}

