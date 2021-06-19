//
//  SearchSuggestionPresenter.swift
//  MovieApp
//
//  Created by bahadir on 19.06.2021.
//

import Foundation

protocol SearchSuggestionPresenterInterface {
    func viewDidLoad()
    func numberOfItems(at section: Int) -> Int
    func sizeOfItem(at indexPath: IndexPath) -> (Double, Double)
    var headerSize: (Double,Double) { get }
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
    func sizeOfItem(at indexPath: IndexPath) -> (Double, Double) {
        if indexPath.section == 0 {
            return (view?.collectionViewWidth ?? .zero, 80.0)
        } else {
            return (view?.collectionViewWidth ?? .zero, 44.0)
        }
    }
    
    var headerSize: (Double, Double) {
        return (view?.collectionViewWidth ?? .zero, 44.0)
    }
    
    func numberOfItems(at section: Int) -> Int {
       return  3
    }
    
    func viewDidLoad() {
        view?.prepareCollectionView()
    }
}
