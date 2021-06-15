//
//  MovieInteractor.swift
//  MovieApp
//
//  Created by bahadir on 15.06.2021.
//

import Foundation
import API

// Presenter Access
protocol MovieInteractorInterface {
    func fetchPopularMovies()
}

// Service output Communication
protocol MovieInteractorOutput: AnyObject {
    func handlePopularMovieResult(_ result: MovieResult)
}

typealias MovieResult = Result<MoviesResponse, APIClientError>

final class MovieInteractor {
    private var networkManager: NetworkManager<MovieEndpoint> = NetworkManager()
    weak var output: MovieInteractorOutput?
    
    init(networkManager: NetworkManager<MovieEndpoint> = NetworkManager()) {
        self.networkManager = networkManager
    }
}

extension MovieInteractor: MovieInteractorInterface {
    func fetchPopularMovies() {
         networkManager.request(endpoint: .popular, type: MoviesResponse.self) { [weak self] (result) in
            self?.output?.handlePopularMovieResult(result)
         }
    }
}
