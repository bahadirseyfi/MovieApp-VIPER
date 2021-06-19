//
//  SearchSuggestionRouter.swift
//  MovieApp
//
//  Created by bahadir on 19.06.2021.
//

import UIKit

protocol SearchSuggestionRouterInterface {
    
}

final class SearchSuggestionRouter {
    
    static func createModule() -> SearchSuggestionViewController {
        let viewController: SearchSuggestionViewController = SearchSuggestionViewController.instantiate(storyboards: .search)
        let router = SearchSuggestionRouter()
        let interactor = SearchSuggestionInteractor()
        let presenter = SearchSuggestionPresenter(view: viewController, router: router, interactor: interactor)
        viewController.presenter = presenter
        
        return viewController
    }
}

extension SearchSuggestionRouter: SearchSuggestionRouterInterface {
    
}
