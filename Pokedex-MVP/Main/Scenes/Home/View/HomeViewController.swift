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
    
    private lazy var searchInputView: SearchInputView = {
        let input = SearchInputView()
        input.placeholder = "What Pokemon are you looking for?"
        return input
    }()
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loaderView: UIActivityIndicatorView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var sortButton: UIButton!
    @IBOutlet weak var generationsButton: UIButton!
    @IBOutlet weak var extraHeaderContentStackView: UIStackView!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    // MARK: - Public Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupTitle()
        setupDescription()
        setupGenerationsButton()
        setupFilterButton()
        setupSortButton()
        setupSearchInputView()
        
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
    
    private func setupTitle() {
        titleLabel.font = Typography.applicationTitle
        titleLabel.textColor = Colors.text.black
        titleLabel.text = "Pokedex"
    }
    
    private func setupDescription() {
        descriptionLabel.font = Typography.description
        descriptionLabel.textColor = Colors.text.gray
        descriptionLabel.text = "Search for Pokémon by name or using the National Pokédex number."
    }
    
    private func setupDataSource() {
        let itemsBuilders = presenter.listItems.map { item -> HomeListItemCellBuilder in
            let cell = HomeListItemCellBuilder(homeListItem: item)
            cell.retryHandler = { [weak self] row in
                self?.presenter.retryFetchPokemon(with: row)
                
            }
            return cell
        }
        
        let section = TableViewSection(cellBuilders: itemsBuilders)
        
        dataSource = TableViewDataSource(
            sections: [section],
            tableView: tableView
        )
    }
    
    private func setupGenerationsButton() {
        generationsButton.setImage(Assets.icon.generations, for: .normal)
        generationsButton.tintColor = Colors.text.black
        generationsButton.backgroundColor = .clear
    }
    
    private func setupFilterButton() {
        filterButton.setImage(Assets.icon.filter, for: .normal)
        filterButton.tintColor = Colors.text.black
        filterButton.backgroundColor = .clear
    }
    
    private func setupSortButton() {
        sortButton.setImage(Assets.icon.sort, for: .normal)
        sortButton.tintColor = Colors.text.black
        sortButton.backgroundColor = .clear
    }
    
    private func setupSearchInputView() {
        extraHeaderContentStackView.addArrangedSubview(searchInputView)
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
    
    func didScroll(_ scrollView: UIScrollView) {
        var offsetY = scrollView.contentOffset.y
        
        if offsetY < 0 {
            offsetY = 0
        }
        
        if offsetY > 180 {
            offsetY = 180
        }
        
        topConstraint.constant = -offsetY
    }
    
    func didSelect(rowAt indexPath: IndexPath) {
        presenter.didSelect(row: indexPath.row)
    }
    
    func willDisplay(rowAt indexPath: IndexPath) {
        presenter.willDisplay(row: indexPath.row)
    }
    
}
