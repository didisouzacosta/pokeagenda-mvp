//
//  UIViewControllerExtension.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 29/01/21.
//

import Foundation
import UIKit

extension UIViewController {
    
    func alert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        alert.addAction(.init(title: "OK", style: .default))
        
        present(alert, animated: true)
    }
    
    func alert(error: Error) {
        let alert = UIAlertController(
            title: "Infelizmente ocorreu um erro",
            message: error.localizedDescription,
            preferredStyle: .alert
        )
        
        alert.addAction(.init(title: "OK", style: .default))
        
        present(alert, animated: true)
    }
    
}
