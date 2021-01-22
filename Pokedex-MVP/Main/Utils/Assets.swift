//
//  Assets.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 21/01/21.
//

import UIKit

struct Assets {
    
    static let icons = Icons()
    
}

extension Assets {
    
    struct Icons {
        let filter = UIImage(named: "filter-icon")!
        let sort = UIImage(named: "sort-icon")!
        let generations = UIImage(named: "generations-icon")!
        let heigths = Heigths()
        let weights = Weights()
        let types = Types()
    }
    
    struct Heigths {
        let sort = UIImage(named: "sort-height-icon")!
        let medium = UIImage(named: "medium-height-icon")!
        let tall = UIImage(named: "tall-height-icon")!
    }
    
    struct Weights {
        let light = UIImage(named: "light-weight-icon")!
        let normal = UIImage(named: "normal-weight-icon")!
        let heavy = UIImage(named: "heavy-weight-icon")!
    }
    
    struct Types {
        let normal = UIImage(named: "normal-type-icon")!
        let fire = UIImage(named: "fire-type-icon")!
        let water = UIImage(named: "water-type-icon")!
        let ground = UIImage(named: "ground-type-icon")!
        let bug = UIImage(named: "bug-type-icon")!
        let dark = UIImage(named: "dark-type-icon")!
        let dragon = UIImage(named: "dragon-type-icon")!
        let eletric = UIImage(named: "eletric-type-icon")!
        let fairy = UIImage(named: "fairy-type-icon")!
        let fighing = UIImage(named: "fighing-type-icon")!
        let flying = UIImage(named: "flying-type-icon")!
        let ghost = UIImage(named: "ghost-type-icon")!
        let grass = UIImage(named: "grass-type-icon")!
        let ice = UIImage(named: "ice-type-icon")!
        let poison = UIImage(named: "poison-type-icon")!
        let psychic = UIImage(named: "psychic-type-icon")!
        let rock = UIImage(named: "rock-type-icon")!
        let steel = UIImage(named: "steel-type-icon")!
    }
    
}
