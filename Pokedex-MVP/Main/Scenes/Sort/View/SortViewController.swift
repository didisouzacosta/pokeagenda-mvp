//
//  SortViewController.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 06/02/21.
//

import Foundation
import UIKit
import PanModal

final class SortViewController: UIViewController {}

extension SortViewController: PanModalPresentable {
    
    var panScrollable: UIScrollView? {
        return nil
    }
    
    var longFormHeight: PanModalHeight {
        return .contentHeight(500)
    }
    
}
