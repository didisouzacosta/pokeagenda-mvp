//
//  AssetsTests.swift
//  Pokedex-MVPTests
//
//  Created by Adriano Souza Costa on 23/01/21.
//

import XCTest
import Nimble
import UIKit

@testable import Pokedex_MVP

class AssetsTests: XCTestCase {

    func testEnsureAppIcons() {
        expect(Assets.icon.filter).to(be(UIImage(named: "filter-icon")))
        expect(Assets.icon.sort).to(be(UIImage(named: "sort-icon")))
        expect(Assets.icon.generations).to(be(UIImage(named: "generations-icon")))
    }
    
    func testEnsureHeightIcons() {
        expect(Assets.icon.heigth.sort).to(be(UIImage(named: "sort-height-icon")))
        expect(Assets.icon.heigth.medium).to(be(UIImage(named: "medium-height-icon")))
        expect(Assets.icon.heigth.tall).to(be(UIImage(named: "tall-height-icon")))
    }
    
    func testEnsureWeightIcons() {
        expect(Assets.icon.weight.light).to(be(UIImage(named: "light-weight-icon")))
        expect(Assets.icon.weight.normal).to(be(UIImage(named: "normal-weight-icon")))
        expect(Assets.icon.weight.heavy).to(be(UIImage(named: "heavy-weight-icon")))
    }
    
    func testEnsurePokemonTypeIcons() {
        expect(Assets.icon.type.bug).to(be(UIImage(named: "bug-type-icon")))
        expect(Assets.icon.type.dark).to(be(UIImage(named: "dark-type-icon")))
        expect(Assets.icon.type.dragon).to(be(UIImage(named: "dragon-type-icon")))
        expect(Assets.icon.type.eletric).to(be(UIImage(named: "electric-type-icon")))
        expect(Assets.icon.type.fairy).to(be(UIImage(named: "fairy-type-icon")))
        expect(Assets.icon.type.fighting).to(be(UIImage(named: "fighting-type-icon")))
        expect(Assets.icon.type.fire).to(be(UIImage(named: "fire-type-icon")))
        expect(Assets.icon.type.flying).to(be(UIImage(named: "flying-type-icon")))
        expect(Assets.icon.type.ghost).to(be(UIImage(named: "ghost-type-icon")))
        expect(Assets.icon.type.grass).to(be(UIImage(named: "grass-type-icon")))
        expect(Assets.icon.type.ground).to(be(UIImage(named: "ground-type-icon")))
        expect(Assets.icon.type.ice).to(be(UIImage(named: "ice-type-icon")))
        expect(Assets.icon.type.normal).to(be(UIImage(named: "normal-type-icon")))
        expect(Assets.icon.type.poison).to(be(UIImage(named: "poison-type-icon")))
        expect(Assets.icon.type.psychic).to(be(UIImage(named: "psychic-type-icon")))
        expect(Assets.icon.type.rock).to(be(UIImage(named: "rock-type-icon")))
        expect(Assets.icon.type.steel).to(be(UIImage(named: "steel-type-icon")))
        expect(Assets.icon.type.water).to(be(UIImage(named: "water-type-icon")))
    }

}
