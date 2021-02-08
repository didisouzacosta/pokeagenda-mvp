//
//  PokemonSectionHeaderView.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 08/02/21.
//

import Foundation
import UIKit

final class PokemonSectionHeaderView: UIView {
    
    // MARK: - Private Properties
    
    private let title: String
    private let type: PokemonType
    
    // MARK: Outlets
    
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var titleLabel: UILabel?
    
    // MARK: - Public Methods
    
    init(title: String, type: PokemonType) {
        self.title = title
        self.type = type
        super.init(frame: .zero)
        Bundle.main.loadNibNamed("PokemonSectionHeaderView", owner: self, options: nil)
        pinning(containerView)
        
        setupTitle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupTitle() {
        titleLabel?.text = title
        titleLabel?.font = Typography.pokemonSection
        titleLabel?.textColor = Colors.type.color(with: type)
    }
    
}
