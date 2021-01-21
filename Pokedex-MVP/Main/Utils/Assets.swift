//
//  Assets.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 21/01/21.
//

import UIKit

final class Assets {
    
    static let icons = Icons()
    
}

extension Assets {
    
    class Icons {
        let filter = UIImage(named: "filter-icon")!
        let sort = UIImage(named: "sort-icon")!
        let generations = UIImage(named: "generations-icon")!
        let heigths = Heigths()
        let weights = Weights()
        let types = Types()
    }
    
    class Heigths {
        let sort = UIImage(named: "sort-height-icon")!
        let medium = UIImage(named: "medium-height-icon")!
        let tall = UIImage(named: "tall-height-icon")!
    }
    
    class Weights {
        let light = UIImage(named: "light-weight-icon")!
        let normal = UIImage(named: "normal-weight-icon")!
        let heavy = UIImage(named: "heavy-weight-icon")!
    }
    
    class Types {
        let normal = UIImage(named: "normal-type-icon")!
        let fire = UIImage(named: "fire-type-icon")!
        let water = UIImage(named: "water-type-icon")!
        let ground = UIImage(named: "ground-type-icon")!
    }
    
}
