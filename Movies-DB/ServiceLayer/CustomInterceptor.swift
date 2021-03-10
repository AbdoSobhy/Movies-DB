//
//  ApiRouter.swift
//  Movies-DB
//
//  Created by Abdelrahman Sobhy on 3/10/21.
//

import Foundation
import Alamofire
class CustomInterceptor: RequestInterceptor {
    
    private let retryCount = 3
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        //        var urlRequest = urlRequest
        //        if let urlString = urlRequest.url?.absoluteString, urlString.contains("movie/top_rated"){
        //            UserDefaults.standard.set("90fd0c6e987f62a4def180feaf9edd9", forKey: "api_key")
        //        }
        //        completion(.success(urlRequest))
    }
    
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        
        request.retryCount < retryCount ? completion(.retry) : completion(.doNotRetry)
        
        //        if let url = request.request?.url?.absoluteString,url.contains("movie") , request.response?.statusCode == 401 {
        //            request.retryCount < retryCount ? completion(.retry) : completion(.doNotRetry)
        //        } else {
        //            completion(.doNotRetry)
        //        }
        
    }
    
    
}
