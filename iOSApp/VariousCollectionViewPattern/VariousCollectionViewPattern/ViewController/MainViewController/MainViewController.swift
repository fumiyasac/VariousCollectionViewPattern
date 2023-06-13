//
//  MainViewController.swift
//  VariousCollectionViewPattern
//
//  Created by 酒井文也 on 2023/03/18.
//

import UIKit

final class MainViewController: UIViewController {

    // MARK: - Initializer

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Override

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBarTitle(GlobalTabBarController.TabBarItems.main.getTitle())
    }
}
