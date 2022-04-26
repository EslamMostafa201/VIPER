//
//  Constants.swift
//  Movies App
//
//  Created by Eslam Mostafa on 26/04/2022.
//

import Foundation

struct Constants {
    //The API's base URL
    static let baseUrl = "https://api.fitness.medion.com"
    
    //The parameters (Queries) that we're gonna use
    struct Parameters {
        static let userId = "userId"
    }
    
    //The header fields
    enum HttpHeaderField: String {
        case authentication = "Authorization"
        case contentType = "Content-Type"
        case acceptType = "Accept"
        case acceptEncoding = "Accept-Encoding"
        case clientId = "X-Client-Id"
    }
    
    //The content type (JSON)
    enum ContentType: String {
        case json = "application/json"
        case clientId = "0bcd09c2-63c5-4c01-943f-ea0e4e7ac33e"
    }
}
