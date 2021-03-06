//
//  PropertiesUI.swift
//  MovieApp
//
//  Created by bahadir on 11.06.2021.
//

import UIKit

struct CellProperties {
    static let cornerRadius: CGFloat = 8
    static let shadowRadius: CGFloat = 6
    static let shadowOpacity: Float = 0.3
    static let shadowOffset = CGSize(width: 0, height: 5)
}

struct NavigationProperties {
    static let largeContentTitle: String = "Movie"
    static let navigationItemName: String = "full_primary"
}

struct TabbarProperties {
    static let title: String = "Movies"
    static let image: String = "anasayfa-x25"
}
