//
//  SearchEndpoint.swift
//  MovieApp
//
//  Created by bahadir on 20.06.2021.
//

import Foundation
import API

enum SearchEndpointItem: Endpoint {
    case query(keyword: String)
    
    var baseURL: String { MovieDBBaseAPI.BaseURL }
    var baseApiVersion: String { MovieDBBaseAPI.BaseAPIVersion }
    var conjunction: String { "search/" }
    var path: String { "query" }
    var key: String { MovieDBBaseAPI.TheMovieDBAPIKey }
    var method: HTTPMethod { .post }
    var parameters: [String : Any] {
        switch self {
        case .query(let keyword):
            return ["query":keyword]
        }
    }
}
