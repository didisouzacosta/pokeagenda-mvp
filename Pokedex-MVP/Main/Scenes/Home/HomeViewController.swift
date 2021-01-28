//
//  HomeViewController.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 21/01/21.
//

import UIKit

protocol HomePresenterView: class {
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
    }
    
    // MARK: - Actions
    
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

