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
    
    // MARK: - Public Methods
    
    func configure(with item: HomeListItem) {
        switch item.state {
        case .isLoading:
            setupLoading()
        case .error(let error):
            setup(with: error)
        case .pokemon(let pokemon):
            setupBox()
            setup(pokemonNumber: "#001")
            setup(pokemonName: "Bulbasour")
            setup(pokemonImage: pokemon.sprites.other.officialArtwork.frontDefault)
        }
    }
    
    // MARK: - Private Methods
    
    private func setupLoading() {
        loadingView.startAnimating()
    }
    
    private func setup(with error: Error) {
        nameLabel.text = "Não foi possível carregar o pokemon"
    }
    
    private func setupBox() {
        boxView.layer.cornerRadius = 10
    }
    
    private func setup(pokemonNumber: String) {
        numberLabel.font = Typography.pokemonNumber
        numberLabel.text = pokemonNumber
    }
    
    private func setup(pokemonName: String) {
        nameLabel.font = Typography.pokemonName
        nameLabel.text = pokemonName
    }
    
    private func setup(pokemonImage: URL) {
        pokemonImageView.loadImage(with: pokemonImage)
    }
    
}
