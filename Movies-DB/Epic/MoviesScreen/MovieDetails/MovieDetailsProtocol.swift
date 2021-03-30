//
//  MovieDetailsProtocol.swift
//  Movies-DB
//
//  Created Abdelrahman Sobhy on 3/10/21.
//  Copyright © 2021 . All rights reserved.
//


import Foundation
import RxSwift

protocol MovieDetailsView: AnyObject {
    var presenter: MovieDetailsPresenter? { get set }

}

protocol MovieDetailsPresenter: AnyObject {
    var view: MovieDetailsView? { get set }
    var movieDetails: PublishSubject<MovieDetailsViewModel> {get}
    func viewDidLoad()

}

protocol MovieDetailsInteractorInput {
    var presenter: MovieDetailsInteractorOutput? { get set }
    func getMovieDetails(movieId: Int)
}

protocol MovieDetailsInteractorOutput {
    func moviesFetchedSuccessfully(with movieDetails: MovieDetails)
    func moviesFetchedError(with error: ErrorHandler)
}

protocol MovieDetailsRouter {

}


