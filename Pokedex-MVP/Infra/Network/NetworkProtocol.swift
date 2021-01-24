//
//  NetworkService.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 23/01/21.
//

import Foundation

public protocol NetworkProtocol {
    
    func request<T: Decodable>(
        type: T.Type,
        endpoint: URL,
        method: RequestMethod,
        parameters: [String: Any]?,
        completionHandler: @escaping (Result<T, Error>) -> Void
    )
    
}

protocol Request {
    var endpoint: String { get }
    var method: RequestMethod { get }
}

public enum RequestMethod {
    case get
    case post
}

struct NotFoundNetworkError: LocalizedError {
    var localizedDescription: String {
        return "Infelizmente o recurso não foi encontrado"
    }
}

