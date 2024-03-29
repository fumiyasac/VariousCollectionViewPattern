//
//  UINavigationControllerExtension.swift
//  VariousCollectionViewPattern
//
//  Created by 酒井文也 on 2023/10/22.
//

import Foundation
import UIKit

// MEMO: Push / Popで画面遷移でCompletionHandlerが必要な場合に利用します
// 参考: https://iganin.hatenablog.com/entry/2019/07/27/172911
extension UINavigationController {

    // Push遷移を完了した際にcompletionHandlerを追加する
    func pushViewController(_ viewController: UIViewController, animated: Bool, completion: @escaping (() -> Void)) {
        pushViewController(viewController, animated: animated)
        if animated, let coordinator = transitionCoordinator {
            coordinator.animate(alongsideTransition: nil) { _ in
                completion()
            }
        } else {
            completion()
        }
    }

    // Pop遷移を完了した際にcompletionHandlerを追加する
    func popViewController(animated: Bool, completion: @escaping (() -> Void)) {
        popViewController(animated: animated)
        if animated, let coordinator = transitionCoordinator {
            coordinator.animate(alongsideTransition: nil) { _ in
                completion()
            }
        } else {
            completion()
        }
    }
}
