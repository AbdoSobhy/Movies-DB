//
//  ApiRouter.swift
//  Movies-DB
//
//  Created by Abdelrahman Sobhy on 3/10/21.
//

import Foundation
import Alamofire

enum ApiRouter: URLRequestConvertible {
    enum Constants{
//        static var baseUrl = "https://"//development
        static var baseUrl = "https://"//production
    }
    
    case products(page : String, limit : Int)
    
    var url : URL {
        switch self {
        case .products:
            return URL(string: "\(Constants.baseUrl)products")!
        }

    }
    
    var method : HTTPMethod {
        switch self {
        case .products:
            return .get
        }
    }
    
    var parameters : [String:Any]{
        switch self {
        default:
            return [:]
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
