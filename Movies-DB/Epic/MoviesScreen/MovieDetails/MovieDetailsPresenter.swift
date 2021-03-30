//
//  MovieDetailsPresenter.swift
//  Movies-DB
//
//  Created Abdelrahman Sobhy on 3/10/21.
//  Copyright © 2021 . All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class MovieDetailsPresenterImpl: MovieDetailsPresenter, MovieDetailsInteractorOutput {
    
    weak var view: MovieDetailsView?
    private let interactor: MovieDetailsInteractorInput
    private let router: MovieDetailsRouter
    let movieDetails = PublishSubject<MovieDetailsViewModel>()
    var movieId: Int
    
    init(view: MovieDetailsView, interactor: MovieDetailsInteractorInput, router: MovieDetailsRouter, movieId: Int) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.movieId = movieId
    }
    
    func moviesFetchedSuccessfully(with movieDetails: MovieDetails) {
        self.movieDetails.onNext(MovieDetailsViewModel(movie: movieDetails))
    }
    
    func moviesFetchedError(with error: ErrorHandler) {
        print(error.errorObject.message)
    }
    
    func viewDidLoad() {
        interactor.getMovieDetails(movieId: movieId)
    }

    
}
