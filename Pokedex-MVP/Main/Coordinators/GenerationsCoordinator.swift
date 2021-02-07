//
//  GenerationsCoordinator.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 06/02/21.
//

import Foundation
import UIKit

final class GenerationsCoordinator: BaseCoordinator {
    
    // MARK: - Public Methods
    
    override func start() {
        let controller = SceneFactory.makeGenerationsScene()
        navigationController.presentPanModal(controller)
    }
    
}
