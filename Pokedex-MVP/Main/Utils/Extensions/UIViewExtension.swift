//
//  UIViewExtension.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 31/01/21.
//

import Foundation
import UIKit

extension UIView {
    
    static var tableFooterView: UIView {
        return .init(frame: .init(x: 0, y: 0, width: 0, height: 1))
    }
    
    func pinning(_ view: UIView) {
        view.frame = CGRect(origin: .zero, size: frame.size)
        addSubview(view)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
}
