//
//  NetworkSpy.swift
//  Pokedex-MVPTests
//
//  Created by Adriano Souza Costa on 24/01/21.
//

import Foundation
import Pokedex_MVP

final class NetworkSpy: NetworkProtocol {
    
    // MARK: - Public Properties
    
    var endpoint: URL?
    var method: RequestMethod?
    var parameters: [String: Any]?
    var error: Error?
    var result: Any?
    
    // MARK: - Public Methods
    
    func request<T: Decodable>(
        type: T.Type,
        endpoint: URL,
        method: RequestMethod,
        parameters: [String: Any]?,
        completionHandler: @escaping (Result<T, Error>) -> Void
    ) {
        self.endpoint = endpoint
        self.method = method
        self.parameters = parameters
        
        if let error = self.error {
            completionHandler(.failure(error))
        } else if let result = self.result as? T {
            completionHandler(.success(result))
        }
    }
    
}
