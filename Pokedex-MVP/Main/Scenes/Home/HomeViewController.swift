//
//  HomeViewController.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 21/01/21.
//

import UIKit

protocol HomePresenterView: class {
    func showLoading(status: Bool)
    func show(error: Error)
    func showFilter()
    func showGenerations()
    func showSort()
}

class HomeViewController: UIViewController {

    // MARK: - Public Properties
    
    var presenter: HomeViewPresenter!
    
    // MARK: - Public Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
    }
    
    // MARK: - Private Methods
    
    private func fetchData() {
        presenter.fetchPokemons()
    }
    
    // MARK: - Actions
    
    @IBAction func fetchPokemonsTapped() {
        presenter.fetchPokemons()
    }
    
    @IBAction func showGenerationsTapped() {
        presenter.generationsButtonTapped()
    }
    
    @IBAction func showSortTapped() {
        presenter.sortButtonTapped()
    }
    
    @IBAction func showFilterTapped() {
        presenter.filterButtonTapped()
    }

}

extension HomeViewController: HomePresenterView {
    
    func showLoading(status: Bool) {
        guard !status else { return }
        alert(title: "Finalizado", message: "\(presenter.items.count) resultados")
    }
    
    func show(error: Error) {
        alert(error: error)
    }
    
    func showFilter() {
        print("Exibir controle")
    }
    
    func showGenerations() {
        print("Exibir generations")
    }
    
    func showSort() {
        print("Exibir sort")
    }
    
}

