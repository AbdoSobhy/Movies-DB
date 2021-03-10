//
//  MovieDetailsProtocol.swift
//  Movies-DB
//
//  Created Abdelrahman Sobhy on 3/10/21.
//  Copyright © 2021 . All rights reserved.
//


import Foundation

protocol MovieDetailsView: AnyObject {
    var presenter: MovieDetailsPresenter? { get set }

}

protocol MovieDetailsPresenter: AnyObject {
    var view: MovieDetailsView? { get set }

}

protocol MovieDetailsInteractorInput {
    var presenter: MovieDetailsInteractorOutput? { get set }
    
}

protocol MovieDetailsInteractorOutput {
    
}

protocol MovieDetailsRouter {

}


