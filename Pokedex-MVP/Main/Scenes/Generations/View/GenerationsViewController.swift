//
//  GenerationsViewController.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 06/02/21.
//

import Foundation
import UIKit
import PanModal

final class GenerationsViewController: UIViewController {}

extension GenerationsViewController: PanModalPresentable {
    
    var panScrollable: UIScrollView? {
        return nil
    }

    var longFormHeight: PanModalHeight {
        return .maxHeight
    }
    
}
