//
//  FilterCoordinator.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 06/02/21.
//

import Foundation
import UIKit

final class FilterCoordinator: BaseCoordinator {
    
    // MARK: - Public Methods
    
    override func start() {
        let controller = SceneFactory.makeFilterScene()
        navigationController.presentPanModal(controller)
    }
    
}
