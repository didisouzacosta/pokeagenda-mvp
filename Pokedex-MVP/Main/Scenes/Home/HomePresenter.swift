//
//  HomePresenter.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 28/01/21.
//

import Foundation

protocol HomeViewPresenter {
    func generationsButtonTapped()
    func sortButtonTapped()
    func filterButtonTapped()
}

class HomePresenter {
    
    // MARK: Private Properties
    
    private weak var view: HomePresenterView?
    
    // MARK: Public Methods
    
    init(view: HomePresenterView) {
        self.view = view
    }
    
}

extension HomePresenter: HomeViewPresenter {
    
    func generationsButtonTapped() {
        view?.showGenerations()
    }
    
    func sortButtonTapped() {
        view?.showSort()
    }
    
    func filterButtonTapped() {
        view?.showFilter()
    }
    
}
