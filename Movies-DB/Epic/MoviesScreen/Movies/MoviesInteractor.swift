//
//  MoviesInteractor.swift
//  Movies-DB
//
//  Created Abdelrahman Sobhy on 3/10/21.
//  Copyright © 2021 . All rights reserved.
//

import Foundation

class MoviesInteractor: MoviesInteractorInput {
    internal var presenter: MoviesInteractorOutput?
    private let moviesRepo = MoviesRepoImpl()
    
    func getMovies(page: Int) {
        moviesRepo.getTopRatedMovies(page: page) { [weak self] response in
            switch response {
            case .success(let topRated):
                self?.presenter?.moviesFetchedSuccessfully(with: topRated)
            case .failure(let error):
                self?.presenter?.moviesFetchedError(with: error)
            }
        }
    }
}
