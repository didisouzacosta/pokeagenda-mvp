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
    
    private let presenterNavigation = UINavigationController()
    
    // MARK: - Public Methods
    
    override func start() {
        let controller = SceneFactory.makePokemonScene()
        presenterNavigation.viewControllers = [controller]
        navigationController.show(presenterNavigation, sender: nil)
    }
    
}
