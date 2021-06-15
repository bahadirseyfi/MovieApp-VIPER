//
//  MovieRouter.swift
//  MovieApp
//
//  Created by bahadir on 15.06.2021.
//

import UIKit

protocol MovieRouterInterface {
    // open
}

 // Presenter Access 
final class MovieRouter {
    weak var navigaitonController: UINavigationController?
    
    init(navigationController: UINavigationController? = nil) {
        self.navigaitonController = navigationController
    }
    
    static func createModule() -> MovieViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(identifier: "MovieViewController") as? MovieViewController
        let interactor = MovieInteractor()
        let presenter = MoviePresenter(view: view, interactor: interactor)
        view?.presenter = presenter
        interactor.output = presenter
        return view
    }
}

extension MovieRouter: MovieRouterInterface {
    // open .... router create
}
