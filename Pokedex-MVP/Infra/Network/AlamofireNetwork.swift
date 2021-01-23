//
//  AlamofireNetwork.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 23/01/21.
//

import Foundation
import Alamofire

final class AlamofireNetwork: Network {
    
    func request<T: Decodable, P: Encodable>(
        type: T.Type,
        endpoint: String,
        method: RequestMethod,
        parameters: P? = nil,
        completionHandler: @escaping (Result<T, Error>) -> Void
    ) {
        AF.request(
            endpoint,
            method: method.alamofireHTTPMethod,
            parameters: parameters
        ).responseData { responseData in
            guard let response = responseData.response else {
                completionHandler(.failure(NoResponseNetworkError()))
                return
            }
            
            switch (response.statusCode) {
                case 200...299:
                    guard let data = responseData.data else {
                        completionHandler(.failure(NoDataNetworkError()))
                        return
                    }
                    
                    do {
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(T.self, from: data)
                        
                        completionHandler(.success(result))
                    } catch {
                        completionHandler(.failure(error))
                    }
                case 400:
                    completionHandler(.failure(NotFoundNetworkError()))
                case 403:
                    completionHandler(.failure(NoPermissionNetworkError()))
                default:
                    completionHandler(.failure(UnkownNetworkError()))
            }
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
