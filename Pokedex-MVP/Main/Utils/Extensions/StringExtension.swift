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
    
    var localized: String {
        return NSLocalizedString(
            self,
            tableName: "Localizable",
            bundle: Bundle.main,
            value: "**\(self)**", comment: ""
        )
    }
    
    func localized(arguments: CVarArg...) -> String {
        let locale = Locale(identifier: "pt-br")
        return String(
            format: self.localized,
            locale: locale,
            arguments: arguments
        )
    }
    
}
