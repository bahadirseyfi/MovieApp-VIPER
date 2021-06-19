//
//  SearchSuggestionViewController.swift
//  MovieApp
//
//  Created by bahadir on 19.06.2021.
//

import UIKit

protocol SearchSuggestionViewInterface: AnyObject {
    
}

final class SearchSuggestionViewController: UIViewController {
    var presenter : SearchSuggestionPresenterInterface!
    
    override func viewDidLoad() {
        view.backgroundColor = .blue
    }
}

extension SearchSuggestionViewController: SearchSuggestionViewInterface {
    
}
