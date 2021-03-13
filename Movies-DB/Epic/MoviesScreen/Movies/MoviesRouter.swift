//
//  MoviesRouter.swift
//  Movies-DB
//
//  Created Abdelrahman Sobhy on 3/10/21.
//  Copyright © 2021 . All rights reserved.
//

import UIKit

class MoviesRouterImpl: MoviesRouter {
    
    var view: MoviesView?
    
    static func createModule() -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier: "MoviesViewController")
        if let viewController = viewController as? MoviesViewController {
            let interactor = MoviesInteractor()
            let router = MoviesRouterImpl()
        let presenter = MoviesPresenterImpl(view: viewController, interactor: interactor, router: router)
            viewController.presenter = presenter
            interactor.presenter = presenter
            router.view = viewController
        }
        return viewController
    }
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "Movie", bundle: nil)
    }
    
}
