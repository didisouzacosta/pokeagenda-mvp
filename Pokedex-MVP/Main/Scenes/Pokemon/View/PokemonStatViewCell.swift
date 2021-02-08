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
    
    func configure(with stat: StatViewModel, type: PokemonType) {
        setupTitle(stat.name)
        setupValue(stat.valueDescription)
        setupProgression(stat.percentage, type: type)
        setupProgessionContainerView()
    }
    
    // MARK: - Private Methods
    
    private func setupTitle(_ name: String) {
        titleLabel.text = name
        titleLabel.font = Typography.description
    }
    
    private func setupValue(_ value: String) {
        valueLabel.text = "\(value)"
        valueLabel.font = Typography.description
    }
    
    private func setupProgessionContainerView() {
        progressionContainerView.clipsToBounds = true
        progressionContainerView.layer.cornerRadius = 2
    }
    
    private func setupProgression(_ percentage: Double, type: PokemonType) {
        let multiplier = CGFloat(percentage / 100)
        progressionView.backgroundColor = Colors.type.color(with: type)
        percentageConstraint = percentageConstraint.setMultiplier(multiplier: multiplier)
    }
    
}
