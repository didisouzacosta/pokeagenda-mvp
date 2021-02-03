//
//  Colors.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 21/01/21.
//

import Foundation
import UIKit

struct Colors {
    
    static let type = TypeColor()
    static let backgroundType = BackgroundTypeColor()
    static let height = HeightColor()
    static let weight = WeightColor()
    static let button = ButtonColor()
    static let text = TextColor()
    static let background = BackgroundColor()
    
}

extension Colors {
    
    struct TypeColor {
        let bug = UIColor.hex("#8CB230")
        let dark = UIColor.hex("#58575F")
        let dragon = UIColor.hex("#0F6AC0")
        let eletric = UIColor.hex("#EED535")
        let fairy = UIColor.hex("#ED6EC7")
        let fighting = UIColor.hex("#D04164")
        let fire = UIColor.hex("#FD7D24")
        let flying = UIColor.hex("#748FC9")
        let ghost = UIColor.hex("#556AAE")
        let grass = UIColor.hex("#62B957")
        let ground = UIColor.hex("#DD7748")
        let ice = UIColor.hex("#61CEC0")
        let normal = UIColor.hex("#9DA0AA")
        let poison = UIColor.hex("#A552CC")
        let psychic = UIColor.hex("#EA5D60")
        let rock = UIColor.hex("#BAAB82")
        let steel = UIColor.hex("#417D9A")
        let water = UIColor.hex("#4A90DA")
        let unknown = UIColor.hex("#000000")
        
        func color(with type: PokemonType) -> UIColor {
            switch type {
            case .bug: return bug
            case .dark: return dark
            case .dragon: return dragon
            case .eletric: return eletric
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
    
    struct BackgroundTypeColor {
        let bug = UIColor.hex("#8BD674")
        let dark = UIColor.hex("#6F6E78")
        let dragon = UIColor.hex("#7383B9")
        let eletric = UIColor.hex("#F2CB55")
        let fairy = UIColor.hex("#EBA8C3")
        let fighting = UIColor.hex("#EB4971")
        let fire = UIColor.hex("#FFA756")
        let flying = UIColor.hex("#83A2E3")
        let ghost = UIColor.hex("#8571BE")
        let grass = UIColor.hex("#8BBE8A")
        let ground = UIColor.hex("#F78551")
        let ice = UIColor.hex("#91D8DF")
        let normal = UIColor.hex("#B5B9C4")
        let poison = UIColor.hex("#9F6E97")
        let psychic = UIColor.hex("#FF6568")
        let rock = UIColor.hex("#D4C294")
        let steel = UIColor.hex("#4C91B3")
        let water = UIColor.hex("#58ABF6")
        let unknown = UIColor.hex("#000000")
        
        func color(with type: PokemonType) -> UIColor {
            switch type {
            case .bug: return bug
            case .dark: return dark
            case .dragon: return dragon
            case .eletric: return eletric
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
    
    struct HeightColor {
        let sort = UIColor.hex("#FFC5E6")
        let medium = UIColor.hex("#AEBFD7")
        let tall = UIColor.hex("#AAACB8")
    }
    
    struct WeightColor {
        let light = UIColor.hex("#99CD7C")
        let normal = UIColor.hex("#57B2DC")
        let heavy = UIColor.hex("#5A92A5")
    }
    
    struct ButtonColor {
        let unselect = UIColor.hex("#F2F2F2")
        let selected = UIColor.hex("#EA5D60")
    }
    
    struct TextColor {
        let white = UIColor.hex("#FFFFFF")
        let black = UIColor.hex("#17171B")
        let gray = UIColor.hex("#747476")
        let text = UIColor.hex("#17171B")
        let textNumber = UIColor.hex("#17171B", alpha: 0.6)
    }
    
    struct BackgroundColor {
        let white = UIColor.hex("#FFFFFF")
        let defaultInput = UIColor.hex("#F2F2F2")
        let pressedInput = UIColor.hex("#E2E2E2")
        let modal = UIColor.hex("#000000")
    }
    
}
