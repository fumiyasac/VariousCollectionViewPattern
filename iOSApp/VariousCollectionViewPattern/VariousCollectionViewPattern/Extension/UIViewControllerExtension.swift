//
//  UIViewControllerExtension.swift
//  VariousCollectionViewPattern
//
//  Created by 酒井文也 on 2023/03/20.
//

import Foundation
import UIKit

// UIViewControllerの拡張
extension UIViewController {

    // MARK: - Function

    // 戻るボタンの「戻る」テキストを削除した状態にするメソッド
    func removeBackButtonText() {

        // NavigationBarをタイトル配色を決定する
        guard let nav = self.navigationController else {
            return
        }
        nav.navigationBar.tintColor = UIColor.white

        // 戻るボタンの文言を消す
        let backButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backButtonItem
    }

    // 回転の許可状態を考慮したUINavigationControllerを適用する
    func applyNavigationController(allowRotate: Bool = false) -> UINavigationController {

        // MEMO: 端末の回転を許可する場合はUINavigationControllerを、そうでない場合はPortraitNavigationControllerを適用する
        if allowRotate {
            return UINavigationController(rootViewController: self)
        } else {
            return PortraitNavigationController(rootViewController: self)
        }
    }
}
