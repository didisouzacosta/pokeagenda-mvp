//
//  PokemonViewController.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 06/02/21.
//

import Foundation
import UIKit

protocol PokemonPresenterView: class {
    func fetchPokemon(with identifier: PokemonIndentifier)
    func showLoading(status: Bool)
    func show(error: Error)
    func setup(with pokemon: PokemonViewModel)
}

final class PokemonViewController: UIViewController {
    
    // MARK: - Public Properties
    
    var presenter: PokemonViewPresenter!
    
    // MARK: - Private Properties
    
    // MARK: Outlets
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var badgesStack: UIStackView!
    
    // MARK - Public Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // MARK - Private Methods
    
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
    
}

extension PokemonViewController: PokemonPresenterView {
    
    func fetchPokemon(with identifier: PokemonIndentifier) {
        presenter.fetchPokemon(with: identifier)
    }
    
    func showLoading(status: Bool) {}
    
    func show(error: Error) {
        alert(error: error)
    }
    
    func setup(with pokemon: PokemonViewModel) {
        setupBackground(with: pokemon.primaryType)
        setup(pokemonNumber: pokemon.order)
        setup(pokemonName: pokemon.name)
        setupBadges(types: pokemon.types)
        setup(pokemonImage: pokemon.image)
    }
}
