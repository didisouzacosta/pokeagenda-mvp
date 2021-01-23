//
//  Assets.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 21/01/21.
//

import UIKit

struct Assets {
    
    static let icon = AppIcon()
    
    static func getPokemonImage(with code: String) -> UIImage {
        return UIImage(named: code) ?? UIImage(named: "unkown_pokemon")!
    }
    
}

extension Assets {
    
    struct AppIcon {
        let filter = UIImage(named: "filter-icon")!
        let sort = UIImage(named: "sort-icon")!
        let generation = UIImage(named: "generations-icon")!
        let heigth = HeigthIcon()
        let weight = WeightIcon()
        let type = TypeIcon()
    }
    
    struct HeigthIcon {
        let sort = UIImage(named: "sort-height-icon")!
        let medium = UIImage(named: "medium-height-icon")!
        let tall = UIImage(named: "tall-height-icon")!
    }
    
    struct WeightIcon {
        let light = UIImage(named: "light-weight-icon")!
        let normal = UIImage(named: "normal-weight-icon")!
        let heavy = UIImage(named: "heavy-weight-icon")!
    }
    
    struct TypeIcon {
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
