//
//  NetworkService.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 23/01/21.
//

import Foundation

protocol Network {
    
    func request<T: Decodable, P: Encodable>(
        type: T.Type,
        endpoint: String,
        method: RequestMethod,
        parameters: P?,
        completionHandler: @escaping (Result<T, Error>) -> Void
    )
    
}

enum RequestMethod {
    case get
    case post
}

struct NotFoundNetworkError: LocalizedError {
    var localizedDescription: String {
        return "Infelizmente o recurso não foi encontrado"
    }
}

struct NoPermissionNetworkError: LocalizedError {
    var localizedDescription: String {
        return "Você não tem acesso para acessar o recurso"
    }
}

struct NoResponseNetworkError: LocalizedError {
    var localizedDescription: String {
        return "Nenhuma resposta foi informada pelo servidor"
    }
}

struct NoDataNetworkError: LocalizedError {
    var localizedDescription: String {
        return "Nenhum dado foi enviado junto ao response"
    }
}

struct UnkownNetworkError: LocalizedError {
    var localizedDescription: String {
        return "Ocorreu um erro desconhecido"
    }
}

