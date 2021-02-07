//
//  PokemonViewController.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 06/02/21.
//

import Foundation
import UIKit

protocol PokemonPresenterView: class {
    func fetchPokemon(with identifier: PokemonIndentifier)
    func showLoading(status: Bool)
    func show(error: Error)
    func setup(with pokemon: PokemonViewModel)
}

final class PokemonViewController: UIViewController {
    
    // MARK: - Public Properties
    
    var presenter: PokemonViewPresenter!
    
    // MARK - Public Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTitle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // MARK - Private Methods
    
    private func setupTitle() {
        
    }
    
}

extension PokemonViewController: PokemonPresenterView {
    
    func fetchPokemon(with identifier: PokemonIndentifier) {
        presenter.fetchPokemon(with: identifier)
    }
    
    func showLoading(status: Bool) {}
    
    func show(error: Error) {
        alert(error: error)
    }
    
    func setup(with pokemon: PokemonViewModel) {
        print(pokemon)
    }
}
