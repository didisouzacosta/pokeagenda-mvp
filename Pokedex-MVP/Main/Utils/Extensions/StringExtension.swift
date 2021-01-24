//
//  StringExtension.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 24/01/21.
//

import Foundation

extension String: LocalizedError {
    
    public var errorDescription: String? {
        return self
    }
    
}
