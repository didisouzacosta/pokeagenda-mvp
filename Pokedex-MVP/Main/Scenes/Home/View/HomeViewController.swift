//
//  HomeViewController.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 21/01/21.
//

import UIKit

protocol HomePresenterView: class {
    func reloadData()
    func update(row: Int)
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
    
    private var section: TableViewSection {
        let itemsBuilders = presenter.listItems.map { item -> HomeListItemCellBuilder in
            let cell = HomeListItemCellBuilder(homeListItem: item)
            cell.retryHandler = { [weak self] row in
                self?.presenter.retryFetchPokemon(with: row)
                
            }
            return cell
        }
        
        return TableViewSection(cellBuilders: itemsBuilders)
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
    @IBOutlet weak var extraHeaderContentStack: UIStackView!
    @IBOutlet weak var primaryHeaderContentStack: UIStackView!
    @IBOutlet weak var headerStack: UIStackView!
    @IBOutlet weak var separatorView: UIView!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    // MARK: - Public Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTitle()
        setupDescription()
        setupGenerationsButton()
        setupFilterButton()
        setupSortButton()
        setupSearchInputView()
        setupSeparator()
        setupDataSource()
        
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
    
    private func setupSeparator() {
        separatorView.alpha = 0
    }
    
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
        extraHeaderContentStack.addArrangedSubview(searchInputView)
    }
    
    private func fetchData() {
        presenter.fetchPokemons()
    }
    
    private func scrollHeader(with contentOffset: CGPoint) {
        let headerHeight = headerStack.bounds.height
        let extraHeaderHeight = extraHeaderContentStack.bounds.height
        let minHeight = headerHeight - extraHeaderHeight
        let offsetY = contentOffset.y
        let fadeOffset: CGFloat = 66
        
        var finalHeight = offsetY
        
        if offsetY < 0 {
            finalHeight = 0
        }
        
        if offsetY > minHeight {
            finalHeight = minHeight
        }
        
        let fadeOutPercentage = ((minHeight - fadeOffset) - offsetY) / 100
        let fadeInPercentage = minHeight * offsetY / 100
        
        primaryHeaderContentStack.alpha = fadeOutPercentage
        separatorView.alpha = fadeInPercentage / 100
        
        topConstraint.constant = -finalHeight
    }
    
    // MARK: - Actions
    
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
        dataSource.sections = [section]
    }
    
    func update(row: Int) {
        let itemBuilder = HomeListItemCellBuilder(homeListItem: presenter.listItems[row])
        itemBuilder.retryHandler = { [weak self] row in
            self?.presenter.retryFetchPokemon(with: row)
        }
        
        dataSource.sections[0].cellBuilders[row] = itemBuilder
    }
    
    func showLoading(status: Bool) {
        guard presenter.listItems.count < 0 else {
            loaderView.stopAnimating()
            return
        }
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
        scrollHeader(with: scrollView.contentOffset)
    }
    
    func didSelect(rowAt indexPath: IndexPath) {
        presenter.didSelect(row: indexPath.row)
    }
    
    func willDisplay(rowAt indexPath: IndexPath) {
        presenter.fetchPokemon(at: indexPath.row)
        
        if indexPath.row == presenter.listItems.count - 5 {
            presenter.loadNextPage()
        }
    }
    
    func prefetchRows(at indexPaths: [IndexPath]) {
        indexPaths.forEach { presenter.fetchPokemon(at: $0.row) }
    }
    
}
