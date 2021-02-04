//
//  Assets.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 21/01/21.
//

import UIKit

struct Assets {
    
    static let icon = AppIcon()
    
}

extension Assets {
    
    struct AppIcon {
        let filter = UIImage(named: "filter-icon")!
        let sort = UIImage(named: "sort-icon")!
        let generations = UIImage(named: "generations-icon")!
        let search = UIImage(named: "search-icon")!
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
        let eletric = UIImage(named: "electric-type-icon")!
        let fairy = UIImage(named: "fairy-type-icon")!
        let fighting = UIImage(named: "fighting-type-icon")!
        let flying = UIImage(named: "flying-type-icon")!
        let ghost = UIImage(named: "ghost-type-icon")!
        let grass = UIImage(named: "grass-type-icon")!
        let ice = UIImage(named: "ice-type-icon")!
        let poison = UIImage(named: "poison-type-icon")!
        let psychic = UIImage(named: "psychic-type-icon")!
        let rock = UIImage(named: "rock-type-icon")!
        let steel = UIImage(named: "steel-type-icon")!
        let unknown = UIImage(named: "normal-type-icon")!
        
        func icon(with type: PokemonType) -> UIImage {
            switch type {
            case .bug: return bug
            case .dark: return dark
            case .dragon: return dragon
            case .electric: return eletric
            case .fairy: return fairy
            case .fighting: return fighting
            case .fire: return fire
            case .flying: return flying
            case .ghost: return ghost
            case .grass: return grass
            case .ground: return ground
            case .ice: return ice
            case .normal: return normal
            case .poison: return poison
            case .psychic: return psychic
            case .rock: return rock
            case .steel: return steel
            case .water: return water
            case .unknown: return unknown
            }
        }
    }
    
}
