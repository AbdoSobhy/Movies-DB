//
//  MoviesRepo.swift
//  Movies-DB
//
//  Created by Abdelrahman Sobhy on 3/11/21.
//

import Foundation

protocol MoviesRepo {
    func getTopRatedMovies(page: Int, completionHandeler: @escaping (Result<TopRated, ErrorHandler>) -> Void)
}

class MoviesRepoImpl: MoviesRepo {
    
    func getTopRatedMovies(page: Int, completionHandeler: @escaping (Result<TopRated, ErrorHandler>) -> Void) {
        ApiRequest.apiCall(responseModel: TopRated.self, request: .topRates(page: page)) { response in
            switch response {
            case .success(let topRated):
                completionHandeler(.success(topRated))
            case .failure(let errorModel):
                completionHandeler(.failure(errorModel))
            }
        }
    }
}
