//
//  Pagination.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 23/01/21.
//

import Foundation

struct Pagination<T: Decodable>: Decodable {
    let count: Int
    let next: Int?
    let prev: Int?
    let results: [T]
}
