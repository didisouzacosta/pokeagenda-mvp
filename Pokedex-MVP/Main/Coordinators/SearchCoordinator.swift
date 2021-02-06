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
    
    private let presenterNavigation = UINavigationController()
    
    // MARK: - Public Methods
    
    override func start() {
        let controller = SceneFactory.makeSearchScene(delegate: self)
        presenterNavigation.viewControllers = [controller]
        presenterNavigation.navigationBar.prefersLargeTitles = true
        navigationController.show(presenterNavigation, sender: nil)
    }
    
}

extension SearchCoordinator: SearchViewPresenterDelegate {
    
    func cancel() {
        presenterNavigation.dismiss(animated: true)
    }
    
    func show(_ pokemon: PokemonIndentifier) {
        let coordinator = PokemonCoordinator()
        start(coordinator: coordinator)
    }
    
}
