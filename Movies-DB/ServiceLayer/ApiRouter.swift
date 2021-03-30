//
//  ApiRouter.swift
//  Movies-DB
//
//  Created by Abdelrahman Sobhy on 3/10/21.
//

import Foundation
import Alamofire
import Keys

enum ApiRouter: URLRequestConvertible {
    enum Constants{
        static let key = MoviesDBKeys()
        static var baseUrl = "https://api.themoviedb.org/3/"
        static let api_token = key.iMDBMovieApiKey
    }
    
    case topRates(page: Int)
    case movieDetails(movieId: Int)
    
    var url : URL {
        switch self {
        case .topRates:
            return URL(string: "\(Constants.baseUrl)movie/top_rated")!
        case .movieDetails(let movieId):
            return URL(string: "\(Constants.baseUrl)movie/\(movieId)")!
        }

    }
    
    var method : HTTPMethod {
        switch self {
        case .topRates, .movieDetails:
            return .get
        }
    }
    
    var parameters : [String:Any]{
        switch self {
        case .topRates(let page):
            return ["api_key": Constants.api_token,
                    "page":page]
        case .movieDetails:
            return ["api_key": Constants.api_token]
        }
    }
    
    var headers : HTTPHeaders {
        switch self {
        default:
            return [:]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.method = method
        urlRequest.headers = headers
        
        switch method {
        case .get, .delete:
           return try URLEncoding.default.encode(urlRequest, with: parameters)
        default:
            return try JSONEncoding.default.encode(urlRequest, with: parameters)
        }
    }
}
