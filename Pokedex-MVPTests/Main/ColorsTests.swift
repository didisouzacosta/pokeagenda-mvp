//
//  ColorsTests.swift
//  Pokedex-MVPTests
//
//  Created by Adriano Souza Costa on 23/01/21.
//

import XCTest
import Nimble

@testable import Pokedex_MVP

class ColorsTests: XCTestCase {

    func testEnsureBackgroundColor() {
        expect(Colors.background.defaultInput).to(equal(UIColor.hex("#F2F2F2")))
        expect(Colors.background.modal).to(equal(UIColor.hex("#000000")))
        expect(Colors.background.pressedInput).to(equal(UIColor.hex("#E2E2E2")))
        expect(Colors.background.white).to(equal(UIColor.hex("#FFFFFF")))
    }
    
    func testEnsureTextColor() {
        expect(Colors.text.black).to(equal(UIColor.hex("#17171B")))
        expect(Colors.text.gray).to(equal(UIColor.hex("#747476")))
        expect(Colors.text.text).to(equal(UIColor.hex("#17171B")))
        expect(Colors.text.white).to(equal(UIColor.hex("#FFFFFF")))
    }
    
    func testEnsureButtonColor() {
        expect(Colors.button.selected).to(equal(UIColor.hex("#EA5D60")))
        expect(Colors.button.unselect).to(equal(UIColor.hex("#F2F2F2")))
    }
    
    func testEnsureWeightColor() {
        expect(Colors.weight.light).to(equal(UIColor.hex("#99CD7C")))
        expect(Colors.weight.normal).to(equal(UIColor.hex("#57B2DC")))
        expect(Colors.weight.heavy).to(equal(UIColor.hex("#5A92A5")))
    }
    
    func testEnsureHeightColor() {
        expect(Colors.height.sort).to(equal(UIColor.hex("#FFC5E6")))
        expect(Colors.height.medium).to(equal(UIColor.hex("#AEBFD7")))
        expect(Colors.height.tall).to(equal(UIColor.hex("#AAACB8")))
    }
    
    func testEnsureTypeColors() {
        expect(Colors.type.bug).to(equal(UIColor.hex("#8CB230")))
        expect(Colors.type.dark).to(equal(UIColor.hex("#58575F")))
        expect(Colors.type.dragon).to(equal(UIColor.hex("#0F6AC0")))
        expect(Colors.type.eletric).to(equal(UIColor.hex("#EED535")))
        expect(Colors.type.fairy).to(equal(UIColor.hex("#ED6EC7")))
        expect(Colors.type.fighting).to(equal(UIColor.hex("#D04164")))
        expect(Colors.type.fire).to(equal(UIColor.hex("#FD7D24")))
        expect(Colors.type.flying).to(equal(UIColor.hex("#748FC9")))
        expect(Colors.type.ghost).to(equal(UIColor.hex("#556AAE")))
        expect(Colors.type.grass).to(equal(UIColor.hex("#62B957")))
        expect(Colors.type.ground).to(equal(UIColor.hex("#DD7748")))
        expect(Colors.type.ice).to(equal(UIColor.hex("#61CEC0")))
        expect(Colors.type.normal).to(equal(UIColor.hex("#9DA0AA")))
        expect(Colors.type.poison).to(equal(UIColor.hex("#A552CC")))
        expect(Colors.type.pyshic).to(equal(UIColor.hex("#EA5D60")))
        expect(Colors.type.rock).to(equal(UIColor.hex("#BAAB82")))
        expect(Colors.type.steel).to(equal(UIColor.hex("#417D9A")))
        expect(Colors.type.water).to(equal(UIColor.hex("#4A90DA")))
    }

}
