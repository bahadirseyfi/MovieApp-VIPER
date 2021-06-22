//
//  SearchSuggestionInteractor.swift
//  MovieApp
//
//  Created by bahadir on 19.06.2021.
//

import API

protocol SearchSuggestionInteractorInterface {
    func fetchSuggestions(keyword: String)
}

final class SearchSuggestionInteractor {
    let networkManager: NetworkManager<SearchEndpointItem>
    init(networkManager: NetworkManager<SearchEndpointItem> = NetworkManager()) {
        self.networkManager = networkManager
    }
}

extension SearchSuggestionInteractor: SearchSuggestionInteractorInterface {
    func fetchSuggestions(keyword: String) {
        networkManager.request(endpoint: .query(keyword: keyword), type: String.self) { (result) in
            //
        }
    }
}
