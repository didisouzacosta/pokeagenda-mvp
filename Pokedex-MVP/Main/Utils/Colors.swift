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
        let glass = UIColor.hex("#62B957")
        let ground = UIColor.hex("#DD7748")
        let ice = UIColor.hex("#61CEC0")
        let normal = UIColor.hex("#9DA0AA")
        let poison = UIColor.hex("#A552CC")
        let pyshic = UIColor.hex("#EA5D60")
        let rock = UIColor.hex("#BAAB82")
        let steel = UIColor.hex("#417D9A")
        let water = UIColor.hex("#4A90DA")
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
    }
    
    struct BackgroundColor {
        let white = UIColor.hex("#FFFFFF")
        let defaultInput = UIColor.hex("#F2F2F2")
        let pressedInput = UIColor.hex("#E2E2E2")
        let modal = UIColor.hex("#000000")
    }
    
}
