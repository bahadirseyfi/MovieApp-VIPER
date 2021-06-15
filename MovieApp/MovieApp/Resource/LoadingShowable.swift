//
//  LoadingView.swift
//  MovieApp
//
//  Created by bahadir on 15.06.2021.
//

import UIKit

protocol LoadingShowable where Self: UIViewController {
    func showToLoading()
    func hideToLoading()
}

extension LoadingShowable {
    func showToLoading() {
        LoadingView.shared.startLoading()
    }

    func hideToLoading() {
        LoadingView.shared.hideLoading()
    }
}
