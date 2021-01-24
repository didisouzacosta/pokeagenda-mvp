//
//  AlamofireNetwork.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 23/01/21.
//

import Foundation
import Alamofire

final class AlamofireNetwork: NetworkProtocol {
    
    func request<T: Decodable>(
        type: T.Type,
        endpoint: URL,
        method: RequestMethod,
        parameters: [String: Any]? = nil,
        completionHandler: @escaping (Result<T, Error>) -> Void
    ) {
        AF.request(
            endpoint,
            method: method.alamofireHTTPMethod,
            parameters: parameters
        )
        .validate()
        .responseDecodable(of: T.self) { response in
            guard let data = response.value else {
                completionHandler(.failure(NotFoundNetworkError()))
                return
            }
            
            completionHandler(.success(data))
        }
    }
    
}

fileprivate extension RequestMethod {
    
    var alamofireHTTPMethod: HTTPMethod {
        switch self {
        case .get:
            return HTTPMethod.get
        case .post:
            return HTTPMethod.post
        }
    }
    
}
