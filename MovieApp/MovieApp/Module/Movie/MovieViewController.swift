//
//  ViewController.swift
//  MovieApp
//
//  Created by bahadir on 9.06.2021.
//

import UIKit

// Presenter Access
protocol MovieViewInterface: AnyObject{
    func reloadPopular()
    func prepareCollectionViews()
  //  func showToLoading()
  //  func hideToLoading()
}

final class MovieViewController: UIViewController {

    @IBOutlet private weak var popularCollectionView: UICollectionView!
    
    var presenter: MoviePresenterInterface!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        title = "Movies"
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 38, height: 38))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "full_primary")
        imageView.image = image
        navigationItem.titleView = imageView
    }
    
    private func redirectTo(movieID: Int) {
        self.view.endEditing(true)
        let vc: DetailViewController = DetailViewController.instantiate(storyboards: .detail)
        vc.viewModel = DetailViewModel(movieID: movieID)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension MovieViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfItems() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = popularCollectionView.dequeCell(cellType: PopularMovieCell.self, indexPath: indexPath)
            if let movie = presenter.popularMovie(indexPath.item) {
                let movieImage =  MovieDBBaseAPI.BaseImagePath + movie.backDropPath
                cell.configureCell(image: movieImage)
            }
            return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            guard let movieID = presenter.popularMovie(indexPath.item)?.movieId else {
                print("Başarız ID ")
                return
            }
            redirectTo(movieID: movieID)
        }
}

extension MovieViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = presenter.calculateCellSize(collectionViewWidth: Double(collectionView.frame.size.width))
             return .init(width: size.width, height: size.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: .zero, left: CGFloat(presenter.cellPadding), bottom: .zero, right: CGFloat(presenter.cellPadding))
    }
}

extension MovieViewController: MovieViewInterface {
    
    func prepareCollectionViews() {
        popularCollectionView.register(cellType: PopularMovieCell.self)
        popularCollectionView.delegate = self
        popularCollectionView.dataSource = self
    }
    
    func reloadPopular() {
        popularCollectionView.reloadData()
    }
}



