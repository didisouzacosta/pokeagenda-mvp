//
//  Pagination.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 23/01/21.
//

import Foundation

public struct Pagination<T: Codable>: Codable {
    let count: Int 
    let results: [T]
    
    public init(_ results: [T]) {
        self.results = results
        self.count = results.count
    }
}

public struct PaginationResultItem: Codable, Equatable {
    let name: String
}
