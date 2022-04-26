//
//  MoviesAPI.swift
//  Movies App
//
//  Created by Eslam Mostafa on 26/04/2022.
//

import Foundation
import Alamofire

enum MoviesAPI: URLRequestConvertible {
    case movies(page: Int)
}

extension MoviesAPI: ApiRouter {
    var path: String {
        switch self {
        case .movies:
            return "discover/movie"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .movies:
            return .get
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .movies(let page):
            return [
                Constants.Parameters.APIKEY : Constants.APIKEY,
                Constants.Parameters.PAGE : "\(page)"
            ]
        }
    }
}
