//
//  MovieDetailsInteractor.swift
//  Movies-DB
//
//  Created Abdelrahman Sobhy on 3/10/21.
//  Copyright © 2021 . All rights reserved.
//

import Foundation

class MovieDetailsInteractor: MovieDetailsInteractorInput {
    var presenter: MovieDetailsInteractorOutput?
    private let moviesRepo = MoviesRepoImpl()

    func getMovieDetails(movieId: Int) {
        moviesRepo.getMovieDetails(movieId: movieId) { [weak self] response in
            switch response {
            case .success(let movieDetails):
                self?.presenter?.moviesFetchedSuccessfully(with: movieDetails)
            case .failure(let errorModel):
                self?.presenter?.moviesFetchedError(with: errorModel)
            }
        }
    }
}
