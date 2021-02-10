//
//  PokemonViewController.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 06/02/21.
//

import Foundation
import UIKit

protocol PokemonPresenterView: class {
    func showLoading(status: Bool)
    func show(error: Error)
    func setup(with pokemon: PokemonViewModel)
}

final class PokemonViewController: UIViewController {
    
    // MARK: - Public Properties
    
    var presenter: PokemonViewPresenter!
    
    // MARK: - Private Properties
    
    private let minScrollHeight: CGFloat = 60
    
    private lazy var dataSource = TableViewDataSource(sections: [], tableView: tableView)
    
    // MARK: Outlets
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTitleLabel: UILabel!
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var badgesStack: UIStackView!
    @IBOutlet weak var statsView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loaderView: UIActivityIndicatorView?
    @IBOutlet weak var topConstraint: NSLayoutConstraint?
    
    // MARK - Public Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupStatsView()
        setupTableView()
        setupDataSource()
        
        presenter.fetchPokemon()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        navigationController?.navigationBar.tintColor = Colors.text.white
        navigationController?.navigationBar.barStyle = .black
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.tintColor = Colors.text.black
        navigationController?.navigationBar.barStyle = .default
    }
    
    // MARK - Private Methods
    
    private func setupStatsView() {
        statsView.layer.cornerRadius = 32
        statsView.backgroundColor = Colors.background.white
    }
    
    private func setupTableView() {
        tableView.tableFooterView = .tableFooterView
    }
    
    private func setupDataSource() {
        dataSource.delegate = self
    }
    
    private func setupBackground(with type: PokemonType) {
        view.backgroundColor = Colors.backgroundType.color(with: type)
    }
    
    private func setup(pokemonNumber: String) {
        numberLabel.font = Typography.pokemonNumber
        numberLabel.textColor = Colors.text.textNumber
        numberLabel.text = pokemonNumber
    }
    
    private func setup(pokemonName: String) {
        nameLabel.font = Typography.pokemonName
        nameLabel.textColor = Colors.text.white
        nameLabel.text = pokemonName
    }
    
    private func setup(pokemonImage: URL) {
        pokemonImageView.loadImage(with: pokemonImage)
    }
    
    private func setupBadges(types: [PokemonType]) {
        badgesStack.subviews.forEach { $0.removeFromSuperview() }
        let badges = types.map(BadgeView.init)
        badges.forEach(badgesStack.addArrangedSubview)
    }
    
    private func setupTitle(with name: String) {
        nameTitleLabel.font = Typography.title
        nameTitleLabel.text = name.uppercased()
    }
    
    private func setupData(with pokemon: PokemonViewModel) {
        let statsSection = TableViewSection(
            cellBuilders: pokemon.stats.map { stat in
                return PokemonStatCellBuilder.init(stat, type: pokemon.primaryType)
            },
            header: PokemonSectionHeaderView(
                title: "stats".localized,
                type: pokemon.primaryType
            )
        )
        
        let abilitiesSection = TableViewSection(
            cellBuilders: pokemon.abilities.map(PokemonAbilityCellBuilder.init),
            header: PokemonSectionHeaderView(
                title: "abilities".localized,
                type: pokemon.primaryType
            )
        )
        
        dataSource.sections = [
            statsSection,
            abilitiesSection
        ]
    }
    
}

extension PokemonViewController: PokemonPresenterView {
    
    func showLoading(status: Bool) {
        loaderView?.setStatus(status)
    }
    
    func show(error: Error) {
        alert(error: error)
    }
    
    func setup(with pokemon: PokemonViewModel) {
        setupBackground(with: pokemon.primaryType)
        setup(pokemonNumber: pokemon.order)
        setup(pokemonName: pokemon.name)
        setupBadges(types: pokemon.types)
        setup(pokemonImage: pokemon.image)
        setupTitle(with: pokemon.name)
        setupData(with: pokemon)
    }
}

extension PokemonViewController: TableViewDataSourceDelegate {
    
//    func didScroll(_ scrollView: UIScrollView) {
//        guard let constraint = topConstraint else { return }
//        let offsetY = scrollView.contentOffset.y
//    }
    
}
