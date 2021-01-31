//
//  HomeListItemViewCell.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 30/01/21.
//

import Foundation
import UIKit

class HomeListItemViewCell: UITableViewCell {
    
    // MARK: - Public Properties
    
    static var identifier: String {
        return "HomeListItemViewCell"
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: Bundle.main)
    }
    
    override var reuseIdentifier: String? {
        return HomeListItemViewCell.identifier
    }
    
    // MARK: - Private Properties
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var boxView: UIView!
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    @IBOutlet weak var badgesStack: UIStackView!
    
    // MARK: - Public Methods
    
    func configure(with item: HomeListItem) {
        switch item.state {
        case .isLoading:
            setupLoading()
        case .error(let error):
            setup(with: error)
        case .pokemon(let pokemon):
            setupBox(with: Colors.backgroundType.color(with: pokemon.primaryType))
            setup(pokemonNumber: pokemon.order)
            setup(pokemonName: pokemon.name)
            setup(pokemonImage: pokemon.image)
            setupBadges(types: pokemon.types)
        }
    }
    
    // MARK: - Private Methods
    
    private func setupLoading() {
        loadingView.startAnimating()
    }
    
    private func setup(with error: Error) {
        nameLabel.text = "Não foi possível carregar o pokemon"
    }
    
    private func setupBox(with color: UIColor) {
        boxView.layer.cornerRadius = 10
        boxView.backgroundColor = color
        boxView.layer.shadowColor = color.cgColor
        boxView.layer.shadowOpacity = 0.3
        boxView.layer.shadowOffset = .init(width: 0, height: 10)
        boxView.layer.shadowRadius = 20
    }
    
    private func setup(pokemonNumber: String) {
        numberLabel.font = Typography.pokemonNumber
        numberLabel.textColor = Colors.text.white
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
        let badges = types.map { BadgeView(type: $0) }
        badges.forEach { badgesStack.addArrangedSubview($0) }
    }
    
}
