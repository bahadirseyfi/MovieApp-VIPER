//
//  SearchSuggestionPresenter.swift
//  MovieApp
//
//  Created by bahadir on 19.06.2021.
//

import Foundation

protocol SearchSuggestionPresenterInterface {
    
}

final class SearchSuggestionPresenter {
    weak var view: SearchSuggestionViewInterface?
    let router: SearchSuggestionRouterInterface
    let interactor: SearchSuggestionInteractorInterface
    
    init(view: SearchSuggestionViewInterface?, router: SearchSuggestionRouterInterface,
         interactor: SearchSuggestionInteractorInterface) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}

extension SearchSuggestionPresenter: SearchSuggestionPresenterInterface {
    
}
