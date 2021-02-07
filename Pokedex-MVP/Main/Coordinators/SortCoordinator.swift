//
//  SortCoordinator.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 06/02/21.
//

import Foundation
import UIKit

final class SortCoordinator: BaseCoordinator {
    
    // MARK: - Public Methods
    
    override func start() {
        let controller = SceneFactory.makeSortScene()
        navigationController.presentPanModal(controller)
    }
    
}
