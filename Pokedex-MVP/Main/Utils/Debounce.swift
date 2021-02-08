//
//  Debounce.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 08/02/21.
//
//  Credits: https://stackoverflow.com/questions/27116684/how-can-i-debounce-a-method-call

import Foundation
import UIKit

class Debounce<T: Equatable> {

    private init() {}

    static func input(
        _ input: T,
        comparedAgainst current: @escaping @autoclosure () -> (T),
        time: TimeInterval = 0.5,
        perform: @escaping (T) -> ()
    ) {
        DispatchQueue.main.asyncAfter(deadline: .now() + time) {
            if input == current() { perform(input) }
        }
    }
    
}
