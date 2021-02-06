//
//  PokemonViewController.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 06/02/21.
//

import Foundation
import UIKit

final class PokemonViewController: UIViewController {
    
    // MARK - Public Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTitle()
    }
    
    // MARK - Private Methods
    
    private func setupTitle() {
        navigationItem.title = "Pokemon"
    }
    
}
