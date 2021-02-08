//
//  UIActivityIndicatorViewExtension.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 08/02/21.
//

import Foundation
import UIKit

extension UIActivityIndicatorView {
    
    func setStatus(_ status: Bool) {
        status ? self.startAnimating() : self.stopAnimating()
    }
    
}
