//
//  StatViewModel.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 08/02/21.
//

import Foundation
import UIKit

public struct StatViewModel {
    
    // MARK: - Public Properties
    
    var name: String {
        return stat.name.localized
    }
    
    var value: Double {
        return stat.value
    }
    
    var valueDescription: String {
        return String(format: "%.0f", stat.value)
    }
    
    var percentage: Double {
        return value / maxStatus * 100
    }
    
    // MARK: - Private Properties
    
    private let stat: Stat
    private let maxStatus: Double = 100
    
    // MARK: - Public Methods
    
    init(_ stat: Stat) {
        self.stat = stat
    }
    
}
