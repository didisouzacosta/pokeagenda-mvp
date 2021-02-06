//
//  Coordinator.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 06/02/21.
//

import Foundation
import UIKit

protocol Coordinator: class {
    var navigationController: UINavigationController { get set }
    func start()
}

class BaseCoordinator: Coordinator {
    var navigationController = UINavigationController()
    
    func start() {
        fatalError("Start method should be implemented.")
    }
}
