//
//  MovieDetailsRouter.swift
//  Movies-DB
//
//  Created Abdelrahman Sobhy on 3/10/21.
//  Copyright © 2021 . All rights reserved.
//

import UIKit

class MovieDetailsRouterImpl: MovieDetailsRouter {
    
    var view: MovieDetailsView?
    
    static func createModule() -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier: "MovieDetailsViewController")
        if let viewController = viewController as? MovieDetailsViewController {
            let interactor = MovieDetailsInteractor()
            let router = MovieDetailsRouterImpl()
        let presenter = MovieDetailsPresenterImpl(view: viewController, interactor: interactor, router: router)
            viewController.presenter = presenter
            interactor.presenter = presenter
            router.view = viewController
        }
        return viewController
    }
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "", bundle: nil)
    }
    
}
