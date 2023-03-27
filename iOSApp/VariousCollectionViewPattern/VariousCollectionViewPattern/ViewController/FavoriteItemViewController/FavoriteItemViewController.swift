//
//  FavoriteItemViewController.swift
//  VariousCollectionViewPattern
//
//  Created by 酒井文也 on 2023/03/21.
//

import UIKit

final class FavoriteItemViewController: UIViewController {

    // MARK: - Override

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBarTitle(GlobalTabBarController.TabBarItems.favorite.getTitle())
    }
}
