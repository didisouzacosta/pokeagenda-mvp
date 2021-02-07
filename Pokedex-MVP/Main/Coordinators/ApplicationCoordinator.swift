//
//  HomeCoordinator.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 06/02/21.
//

import Foundation
import UIKit

final class ApplicationCoordinator: BaseCoordinator {
    
    // MARK: - Private Properties
    
    private let mainWindow: UIWindow
    
    // MARK: - Public Methods
    
    init(mainWindow: UIWindow) {
        self.mainWindow = mainWindow
        super.init()
    }
    
    override func start() {
        let controller = SceneFactory.makeHomeScene(delegate: self)
        navigationController.viewControllers = [controller]
        mainWindow.rootViewController = navigationController
    }
    
}

extension ApplicationCoordinator: HomeViewPresenterDelegate {
    
    func showFilter() {
        let coordinator = FilterCoordinator()
        start(coordinator: coordinator)
    }
    
    func showGenerations() {
        let coordinator = GenerationsCoordinator()
        start(coordinator: coordinator)
    }
    
    func showSort() {
        let coordinator = SortCoordinator()
        start(coordinator: coordinator)
    }
    
    func showSearch() {
        let coordinator = SearchCoordinator()
        start(coordinator: coordinator)
    }
    
    func show(pokemon identifier: PokemonIndentifier) {
        let coordinator = PokemonCoordinator()
        coordinator.navigationController = navigationController
        coordinator.start(with: identifier)
    }
    
}
