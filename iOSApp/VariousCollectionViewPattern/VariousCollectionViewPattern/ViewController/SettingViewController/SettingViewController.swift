//
//  SettingViewController.swift
//  VariousCollectionViewPattern
//
//  Created by 酒井文也 on 2023/03/21.
//

import UIKit

final class SettingViewController: UIViewController {

    // MARK: - Override

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.title = GlobalTabBarController.TabBarItems.setting.getTitle()
    }
}
