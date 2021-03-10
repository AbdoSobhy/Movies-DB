//
//  MovieDetailsPresenter.swift
//  Movies-DB
//
//  Created Abdelrahman Sobhy on 3/10/21.
//  Copyright © 2021 . All rights reserved.
//

import Foundation

class MovieDetailsPresenterImpl: MovieDetailsPresenter, MovieDetailsInteractorOutput {
    
    weak var view: MovieDetailsView?
    private let interactor: MovieDetailsInteractorInput
    private let router: MovieDetailsRouter
    
    
    init(view: MovieDetailsView, interactor: MovieDetailsInteractorInput, router: MovieDetailsRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}
