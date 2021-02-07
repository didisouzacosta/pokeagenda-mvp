//
//  SearchCoordinator.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 06/02/21.
//

import Foundation
import UIKit

final class SearchCoordinator: BaseCoordinator {
    
    // MARK: - Public Methods
    
    override func start() {
        let controller = SceneFactory.makeSearchScene(delegate: self)
        navigationController.show(controller, sender: nil)
    }
    
}

extension SearchCoordinator: SearchViewPresenterDelegate {
    
    func show(pokemon identifier: PokemonIndentifier) {
        let coordinator = PokemonCoordinator()
        coordinator.navigationController = navigationController
        coordinator.start(with: identifier)
    }
    
}
