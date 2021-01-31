//
//  UIViewExtension.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 31/01/21.
//

import Foundation
import UIKit

extension UIView {
    
    func pinning(_ view: UIView) {
        view.frame = CGRect(origin: .zero, size: frame.size)
        addSubview(view)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
}
