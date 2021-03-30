//
//  MoviesProtocol.swift
//  Movies-DB
//
//  Created Abdelrahman Sobhy on 3/10/21.
//  Copyright © 2021 . All rights reserved.
//


import Foundation
import RxSwift

protocol MoviesView: UIViewController {
    var presenter: MoviesPresenter? { get set }

}

protocol MoviesPresenter: AnyObject {
    var view: MoviesView? { get set }
    var moviesObserver: Observable<[MovieResult]> {get}
    func viewDidLoad()
    func didSelectRow(at: Int, with: MovieResult)

}

protocol MoviesInteractorInput {
    var presenter: MoviesInteractorOutput? { get set }
    func getMovies(page: Int)
}

protocol MoviesInteractorOutput {
    func moviesFetchedSuccessfully(with movie: TopRated)
    func moviesFetchedError(with error: ErrorHandler)

}

protocol MoviesRouter {
    func navigateToDetailsScreen(movieId: Int)
}


