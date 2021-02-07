//
//  SearchViewCell.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 06/02/21.
//

import Foundation
import UIKit

final class SearchViewCell: UITableViewCell {
    
    // MARK: - Public Properties
    
    static var identifier: String {
        return "SearchViewCell"
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: Bundle.main)
    }
    
    override var reuseIdentifier: String? {
        return SearchViewCell.identifier
    }
    
    // MARK: Outlets
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var badgeStack: UIStackView!
    
    // MARK: - Public Methods
    
    func configure(with pokemon: PokemonViewModel) {
        setup(pokemonNumber: pokemon.order)
        setup(pokemonName: pokemon.name)
        setup(pokemonImage: pokemon.image)
        setupBadge(primaryType: pokemon.primaryType)
    }
    
    // MARK: - Private Methods
    
    private func setup(pokemonNumber: String) {
        numberLabel.font = Typography.pokemonNumber
        numberLabel.textColor = Colors.text.textNumber
        numberLabel.text = pokemonNumber
    }
    
    private func setup(pokemonName: String) {
        nameLabel.font = Typography.pokemonName
        nameLabel.textColor = Colors.text.black
        nameLabel.text = pokemonName
    }
    
    private func setup(pokemonImage: URL) {
        pokemonImageView.loadImage(with: pokemonImage)
    }
    
    private func setupBadge(primaryType: PokemonType) {
        badgeStack.subviews.forEach { $0.removeFromSuperview() }
        let badge = BadgeView(type: primaryType)
        badgeStack.addArrangedSubview(badge)
    }
    
}
