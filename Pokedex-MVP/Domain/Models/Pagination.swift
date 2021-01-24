//
//  Pagination.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 23/01/21.
//

import Foundation

struct Pagination<T: Codable>: Codable {
    let count: Int 
    let results: [T]
}

struct PaginationResultItem: Codable {
    let name: String
}
