//
//  MoviesProtocol.swift
//  Movies-DB
//
//  Created Abdelrahman Sobhy on 3/10/21.
//  Copyright © 2021 . All rights reserved.
//


import Foundation

protocol MoviesView: AnyObject {
    var presenter: MoviesPresenter? { get set }

}

protocol MoviesPresenter: AnyObject {
    var view: MoviesView? { get set }

}

protocol MoviesInteractorInput {
    var presenter: MoviesInteractorOutput? { get set }
    
}

protocol MoviesInteractorOutput {
    
}

protocol MoviesRouter {

}


