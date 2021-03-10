//
//  MoviesPresenter.swift
//  Movies-DB
//
//  Created Abdelrahman Sobhy on 3/10/21.
//  Copyright © 2021 . All rights reserved.
//

import Foundation

class MoviesPresenterImpl: MoviesPresenter, MoviesInteractorOutput {
    
    weak var view: MoviesView?
    private let interactor: MoviesInteractorInput
    private let router: MoviesRouter
    
    
    init(view: MoviesView, interactor: MoviesInteractorInput, router: MoviesRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}
