//
//  SearchCoordinator.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 06/02/21.
//

import Foundation
import UIKit

final class SearchCoordinator: BaseCoordinator {
    
    // MARK: - Private Properties
    
//    private let presenterNavigation = UINavigationController()
    
    // MARK: - Public Methods
    
    override func start() {
        let controller = SceneFactory.makeSearchScene(delegate: self)
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.show(controller, sender: nil)
    }
    
}

extension SearchCoordinator: SearchViewPresenterDelegate {
    
    func show(_ pokemon: PokemonIndentifier) {
        let coordinator = PokemonCoordinator()
        start(coordinator: coordinator)
    }
    
}
