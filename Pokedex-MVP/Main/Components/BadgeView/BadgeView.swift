//
//  BadgeView.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 31/01/21.
//

import Foundation
import UIKit

final class BadgeView: UIView {
    
    // MARK: - Private Properties
    
    private let type: PokemonType
    
    // MARK: Outlets
    
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var typeImage: UIImageView!
    
    // MARK: - Public Methods
    
    init(type: PokemonType) {
        self.type = type
        super.init(frame: .zero)
        Bundle.main.loadNibNamed("BadgeView", owner: self, options: nil)
        pinning(containerView)
        
        setupBackground()
        setupTitle()
        setupImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupBackground() {
        contentView.layer.cornerRadius = 4
        contentView.backgroundColor = Colors.type.color(with: type)
    }
    
    private func setupTitle() {
        titleLabel.textColor = Colors.text.white
        titleLabel.text = type.rawValue.capitalized
    }
    
    private func setupImage() {
        typeImage.image = Assets.icon.type.icon(with: type)
    }
    
}
