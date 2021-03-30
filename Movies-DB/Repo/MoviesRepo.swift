//
//  MoviesRepo.swift
//  Movies-DB
//
//  Created by Abdelrahman Sobhy on 3/11/21.
//

import Foundation

protocol MoviesRepo {
    func getTopRatedMovies(page: Int, completionHandeler: @escaping (Result<TopRated, ErrorHandler>) -> Void)
    func getMovieDetails(movieId: Int, completionHandeler: @escaping (Result<MovieDetails, ErrorHandler>) -> Void)

}

class MoviesRepoImpl: MoviesRepo {
    func getMovieDetails(movieId: Int, completionHandeler: @escaping (Result<MovieDetails, ErrorHandler>) -> Void) {
        ApiRequest.apiCall(responseModel: MovieDetails.self, request: .movieDetails(movieId: movieId)) { response in
            switch response {
            case .success(let movieDetails):
                completionHandeler(.success(movieDetails))
            case .failure(let errorModel):
                completionHandeler(.failure(errorModel))
            }
        }
    }
    
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
