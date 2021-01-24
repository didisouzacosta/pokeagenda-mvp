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
        
        let useCase = UseCaseFactory.makeFetchGenerationsUseCase()
        
        useCase.execute { response in
            do {
                let result = try response.get()
                print(result)
            } catch {
                print(error)
                
            }
        }
    }

}

