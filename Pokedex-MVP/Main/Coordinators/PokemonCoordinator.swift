//
//  PokemonCoordinator.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 06/02/21.
//

import Foundation
import UIKit

final class PokemonCoordinator: BaseCoordinator {
    
    // MARK: - Private Properties
    
    // MARK: - Public Methods
    
    override func start() {
        fatalError("Start method was not implemented.")
    }
    
    func start(with identifier: PokemonIndentifier) {
        let controller = SceneFactory.makePokemonScene()
        navigationController.show(controller, sender: nil)
        controller.fetchPokemon(with: identifier)
    }
    
}
