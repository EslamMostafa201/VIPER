//
//  MovieDetailsAPI.swift
//  Movies App
//
//  Created by Eslam Mostafa on 27/04/2022.
//

import Foundation
import Alamofire

enum MovieDetailsAPI: URLRequestConvertible {
    case movieDetails(id: Int)
}

extension MovieDetailsAPI: ApiRouter {
    var path: String {
        switch self {
        case .movieDetails(let id):
            return "movie/\(id)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .movieDetails:
            return .get
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .movieDetails:
            return [
                Constants.Parameters.APIKEY : Constants.APIKEY,
            ]
        }
    }
}
