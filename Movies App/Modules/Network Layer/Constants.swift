//
//  Constants.swift
//  Movies App
//
//  Created by Eslam Mostafa on 26/04/2022.
//

import Foundation

struct Constants {
    //The API's base URL
    static let baseUrl = "https://api.themoviedb.org/3/"
    static let APIKEY = "c9856d0cb57c3f14bf75bdc6c063b8f3"
    
    //The parameters (Queries) that we're gonna use
    struct Parameters {
        static let APIKEY = "api_key"
        static let PAGE = "page"
    }
    
    //The header fields
    enum HttpHeaderField: String {
        case authentication = "Authorization"
        case contentType = "Content-Type"
        case acceptType = "Accept"
        case acceptEncoding = "Accept-Encoding"
    }
    
    //The content type (JSON)
    enum ContentType: String {
        case json = "application/json"
    }
}
