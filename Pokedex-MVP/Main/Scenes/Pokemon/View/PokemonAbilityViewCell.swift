//
//  PokemonAbilityViewCell.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 08/02/21.
//

import Foundation
import UIKit

class PokemonAbilityViewCell: UITableViewCell {
    
    // MARK: - Public Properties
    
    static var identifier: String {
        return "PokemonAbilityViewCell"
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: Bundle.main)
    }
    
    override var reuseIdentifier: String? {
        return PokemonAbilityViewCell.identifier
    }
    
    var retryHandler: (() -> Void)?
    
    // MARK: - Private Properties
    
    @IBOutlet weak var abilityLabel: UILabel!
    
    // MARK: - Public Methods
    
    func configure(with ability: String) {
        abilityLabel.text = ability
        abilityLabel.font = Typography.description
    }
    
}
