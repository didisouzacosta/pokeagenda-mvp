//
//  GenerationsRequest.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 23/01/21.
//

import Foundation

struct GenerationsRequest: Request {
    
    var endpoint: String {
        return "generations"
    }
    
    var method: RequestMethod {
        return .get
    }
    
    var parameters: [String : Any]? {
        return nil
    }
    
}
