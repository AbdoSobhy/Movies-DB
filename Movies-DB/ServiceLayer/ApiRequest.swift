//
//  ApiRouter.swift
//  Movies-DB
//
//  Created by Abdelrahman Sobhy on 3/10/21.
//

import Foundation
import Alamofire

class ApiRequest{
    
    static func apiCall<T : Decodable>(responseModel: T.Type, request : ApiRouter,  completionHandeler: @escaping (Result<T,ErrorHandler>) -> Void) {
        let reachability = try? Reachability.init()
        if reachability!.connection == .unavailable {
            completionHandeler(.failure(.noInternet))
            return
        }
        AF.request(request, interceptor: CustomInterceptor()).responseData { (response : AFDataResponse<Data>) in
            
            guard let statusCode = (response.response?.statusCode)
            else{
                completionHandeler(.failure(.general))
                return
            }
            switch response.result{
            case .success(let result):
                guard !result.isEmpty else {
                    completionHandeler(.failure(.general))
                    return
                }
                guard (200...299).contains(statusCode), let obj = try? JSONDecoder().decode(T.self, from: result) else {
                    completionHandeler(.failure(.checkStatus(code: statusCode, response: response.data)))
                    return
                }
                completionHandeler(.success(obj))
            case .failure:
                completionHandeler(.failure(.checkStatus(code: statusCode)))
            }
            
        }
    }
}
