//
//  MoviePresenter.swift
//  MovieApp
//
//  Created by bahadir on 15.06.2021.
//

import Foundation

// VC Access
protocol MoviePresenterInterface {
    func numberOfItems() -> Int?
    var cellPadding: Double { get }
    func viewDidLoad()
    func popularMovie(_ index: Int) -> Movie?
    func calculateCellSize(collectionViewWidth: Double) -> (width: Double, height: Double)
}

extension MoviePresenter {
    fileprivate enum Constants {
        static let cellLeftPadding: Double = 15
        static let cellRightPadding: Double = 15
        static let cellBannerImageViewAspectRatio: Double = 130/345
        static let cellDescriptionViewHeight: Double = 60
    }
}

final class MoviePresenter {
    weak var view: MovieViewInterface?
    private var popularMovies: [Movie] = []
    private let interactor: MovieInteractorInterface
    
    private func fetchPopularMovies() {
        interactor.fetchPopularMovies()
    }
    
    init(view: MovieViewInterface?, interactor: MovieInteractorInterface) {
        self.view = view
        self.interactor = interactor
    }
}

extension MoviePresenter: MoviePresenterInterface {
    func viewDidLoad() {
        view?.prepareCollectionViews()
        fetchPopularMovies()
    }
    
    func popularMovie(_ index: Int) -> Movie? {
        popularMovies[index]
    }

    func numberOfItems() -> Int? {
        popularMovies.count
    }
    
    func calculateCellSize(collectionViewWidth: Double) -> (width: Double, height: Double) {
        let cellWidth = collectionViewWidth - (Constants.cellLeftPadding + Constants.cellRightPadding)
        let bannerImageHeight = cellWidth * Constants.cellBannerImageViewAspectRatio
        return (width: cellWidth, height: Constants.cellDescriptionViewHeight + bannerImageHeight)
    }
    
    var cellPadding: Double {
        Constants.cellLeftPadding
    }
}

extension MoviePresenter: MovieInteractorOutput {
    func handlePopularMovieResult(_ result: MovieResult) {
        // view?.showLoading()
          switch result {
          case .success(let response):
              popularMovies = response.results
              view?.reloadPopular()
              break
          case .failure(let error):
              print("Failure : ", error)
              break
          }
    }
}
