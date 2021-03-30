//
//  MoviesPresenter.swift
//  Movies-DB
//
//  Created Abdelrahman Sobhy on 3/10/21.
//  Copyright © 2021 . All rights reserved.
//

import Foundation
import RxSwift

class MoviesPresenterImpl: MoviesPresenter, MoviesInteractorOutput {
    
    weak var view: MoviesView?
    private let interactor: MoviesInteractorInput
    private let router: MoviesRouter
    private var movies = PublishSubject<[MovieResult]>()
    var moviesObserver: Observable<[MovieResult]>{return movies}
    
    init(view: MoviesView, interactor: MoviesInteractorInput, router: MoviesRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        interactor.getMovies(page: 1)
    }
    
    func didSelectRow(at: Int, with movie: MovieResult) {
        router.navigateToDetailsScreen(movieId: movie.id)
    }
    
    func moviesFetchedSuccessfully(with movie: TopRated) {
        self.movies.onNext(movie.results)
    }
    
    func moviesFetchedError(with error: ErrorHandler) {
        print(error.errorObject.message)
    }

    
}
