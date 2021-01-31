//
//  UIImageExtension.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 30/01/21.
//

import Foundation
import UIKit
import Nuke

extension UIImageView {
    
    func loadImage(with url: URL?) {
        guard let url = url else { return }
        
        let options = ImageLoadingOptions(
            transition: .fadeIn(duration: 0.33)
        )
        
        Nuke.loadImage(with: url, options: options, into: self)
    }
    
}
