//
//  ApiRouter.swift
//  Movies-DB
//
//  Created by Abdelrahman Sobhy on 3/10/21.
//

import Foundation

enum ErrorHandler : Error {
    
    case general
    case checkStatus(code : Int, response: Data? = nil)
    case noInternet
    
    var errorObject : GeneralError {
        switch self {
        case .noInternet:
            return GeneralError(code: 0, message: "No Internet Connection")
        case .general:
            return GeneralError(code: 0, message: "General Error")
        case .checkStatus(let code, let response):
            if let response = response, let error = try? JSONDecoder().decode(GeneralError.self, from: response) {
                return error
            } else if code == 404 {
                return GeneralError(code: 0, message: "Not Found")
            } else if code == 401 {
                return GeneralError(code: 0, message: "Not Authanarized")
            }
            if (200..<300).contains(code) {
                return GeneralError(code: 0, message:"parsing error")
            }
        }
        return GeneralError(code: 0, message: "general error")
    }
}



