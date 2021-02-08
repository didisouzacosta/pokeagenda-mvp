//
//  PokemonStatViewCell.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 08/02/21.
//

import Foundation
import UIKit

class PokemonStatViewCell: UITableViewCell {
    
    // MARK: - Public Properties
    
    static var identifier: String {
        return "PokemonStatViewCell"
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: Bundle.main)
    }
    
    override var reuseIdentifier: String? {
        return PokemonStatViewCell.identifier
    }
    
    var retryHandler: (() -> Void)?
    
    // MARK: - Private Properties
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    // MARK: - Public Methods
    
    func configure(with stat: Stat) {
        setupTitle(stat.name)
        setupValue(stat.value)
    }
    
    // MARK: - Private Methods
    
    private func setupTitle(_ name: String) {
        titleLabel.text = name
    }
    
    private func setupValue(_ value: Int) {
        valueLabel.text = "\(value)"
    }
    
}
