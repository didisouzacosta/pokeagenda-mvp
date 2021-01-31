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
    
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Public Methods
    
    func configure(with item: HomeListItem) {
        switch item.state {
        case .isLoading:
            titleLabel.text = "Carregando..."
        case .error:
            titleLabel.text = "Não foi possível carregar o pokemon"
        case .pokemon(let pokemon):
            titleLabel.text = pokemon.types[0].type.name
        }
    }
    
}