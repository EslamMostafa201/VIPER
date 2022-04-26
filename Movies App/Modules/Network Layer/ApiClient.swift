//
//  ApiClient.swift
//  Movies App
//
//  Created by Eslam Mostafa on 26/04/2022.
//

import Foundation
import Alamofire

protocol ApiClientProtocol {
    func sendRequest<T: Codable>(_ urlConvertible: URLRequestConvertible, decadoingType: T.Type, completion: @escaping (Result<T, Error>) -> Void )
}

class ApiClient: ApiClientProtocol {
    func sendRequest<T: Codable>(_ urlConvertible: URLRequestConvertible, decadoingType: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        AF.request(urlConvertible).responseDecodable { (response: DataResponse<T, AFError>) in
            
            if let networkResponse = response.response {
                self.logRequest(response: networkResponse)
            }
            
            switch response.result {
            case .success(let value):
                if let data = response.data , let utf8Text = String(data: data, encoding: .utf8) {
                    if let networkResponse = response.response {
                        self.logResponse(response: networkResponse, data: data, jsonData: utf8Text)
                    }
                }
                
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    private func logRequest(response: HTTPURLResponse) {
        let successMessage: String = (200..<300).contains(response.statusCode) ? "✅" : "❌"
        print("""
            👻 NEW Request================================ \(successMessage)
                \(String(describing: response.url))
                🌐 request headers: \(response.headers.dictionary)
                authorization token: \(response.allHeaderFields["authorization"] ?? "empty authorization token.")
            """)
    }
    
    private func logResponse(response: HTTPURLResponse, data: Data?, jsonData: String) {
        print("\n-----------------Response start------------------\n")
        print("status code: \(response.statusCode) \n")
        print("json:-",jsonData)
        print("\n\nData:-\n")
        print((try? JSONSerialization.jsonObject(with: data ?? Data.init(), options: [])) ?? "Data could not be serialized")
        
    }
    
    private func logError(error: Error?) {
        print("\n-----------------Response start------------------\n")
        print(error?.localizedDescription ?? "unable to print error")
    }
}
