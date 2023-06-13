//
//  FeaturedViewController.swift
//  VariousCollectionViewPattern
//
//  Created by 酒井文也 on 2023/05/20.
//

import UIKit

final class FeaturedViewController: UIViewController {

    // MARK: - Initializer

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Override

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBarTitle(GlobalTabBarController.TabBarItems.featured.getTitle())
    }
}
