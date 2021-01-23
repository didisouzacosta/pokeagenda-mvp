//
//  ViewController.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 21/01/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let useCase = UseCaseFactory.makeGetGenerationsUseCase()
        
        useCase.execute { response in
            print(response)
        }
    }

}

