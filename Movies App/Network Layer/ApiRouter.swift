//
//  ApiRouter.swift
//  Movies App
//
//  Created by Eslam Mostafa on 26/04/2022.
//

import Foundation
import Alamofire

protocol ApiRouter {
    //MARK: - HttpMethod
    //This returns the HttpMethod type. It's used to determine the type if several endpoints are peresent
    var method: HTTPMethod { get }
    
    //MARK: - Path
    //The path is the part following the base url
    var path: String { get }
    
    //MARK: - Parameters
    //This is the queries part, it's optional because an endpoint can be without parameters
    var parameters: Parameters? { get }
}

extension ApiRouter {
    
    //MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try (Constants.BASEURL).asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        //Http method
        urlRequest.httpMethod = method.rawValue
        // Common Headers
        urlRequest.setValue(Constants.ContentType.json.rawValue, forHTTPHeaderField: Constants.HttpHeaderField.contentType.rawValue)
        
        //Encoding
        let encoding: ParameterEncoding = {
            switch method {
            case .get:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        
        print("URL:- ",url,Serialization(object: parameters as AnyObject))
        return try encoding.encode(urlRequest, with: parameters)
    }
    
    private func Serialization(object: AnyObject)  -> String {
        do {
            let stringData = try JSONSerialization.data(withJSONObject: object, options: [])
            if let string = String(data: stringData, encoding: String.Encoding.utf8){
                return string
            }
        } catch _ {
            
        }
        return "{\"element\":\"jsonError\"}"
    }
}
