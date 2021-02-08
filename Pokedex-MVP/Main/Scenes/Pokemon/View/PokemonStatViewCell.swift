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
    @IBOutlet weak var progressionView: UIView!
    @IBOutlet weak var progressionContainerView: UIView!
    @IBOutlet weak var percentageConstraint: NSLayoutConstraint!
    
    // MARK: - Public Methods
    
    func configure(with stat: Stat, type: PokemonType) {
        setupTitle(stat.name)
        setupValue(stat.value)
        setupProgression(stat.value, type: type)
        setupProgessionContainerView()
    }
    
    // MARK: - Private Methods
    
    private func setupTitle(_ name: String) {
        titleLabel.text = name
    }
    
    private func setupValue(_ value: Double) {
        valueLabel.text = "\(value)"
    }
    
    private func setupProgessionContainerView() {
        progressionContainerView.clipsToBounds = true
        progressionContainerView.layer.cornerRadius = 2
    }
    
    private func setupProgression(_ value: Double, type: PokemonType) {
        let percentage: Double = (value * 100 / 100) / 100
        progressionView.backgroundColor = Colors.type.color(with: type)
        percentageConstraint = percentageConstraint.setMultiplier(multiplier: CGFloat(percentage))
    }
    
}
