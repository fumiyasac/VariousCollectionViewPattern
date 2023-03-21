//
//  GlobalTabBarController.swift
//  VariousCollectionViewPattern
//
//  Created by 酒井文也 on 2023/03/21.
//

import UIKit

final class GlobalTabBarController: UITabBarController {

    // MARK: - Enum

    // MEMO: BaseTabBarControllerへ配置するものに関する設定
    private enum TabBarItemsType: CaseIterable {

        case main
        case search
        case favorite
        case setting

        // MARK: - Function

        // 配置するタイトルを取得する
        func getTitle() -> String {
            switch self {
            case .main:
                return "ラーメン道中記"
            case .search:
                return "お店を探す"
            case .favorite:
                return "おすすめのお店"
            case .setting:
                return "おすすめのお店"
            }
        }

        // 配置するSF Symbolsのアイコン名前を取得する
        func getSymbolName() -> String {
            switch self {
            case .main:
                return "house.fill"
            case .search:
                return "magnifyingglass.circle"
            case .favorite:
                return "rectangle.stack.fill"
            case .setting:
                return "rectangle.stack.fill"
            }
        }
    }

    // MARK: - Properties

    private let itemSize = CGSize(width: 28.0, height: 28.0)
    private let normalColor: UIColor = UIColor.lightGray
    private let selectedColor: UIColor = UIColor(code: "#ddcfb8")
    private let tabBarItemFont = UIFont(name: "HelveticaNeue-Medium", size: 10)!

    // MEMO: UITabBarの切り替え時に実行するカスタムトランジションのクラス
    private let globalTabBarTransition = GlobalTabBarTransition()

    // TabBar部分を押下した際に発火するアニメーション(CoreAnimation)
    private var bounceAnimation: CAKeyframeAnimation = {
        let bounceAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        bounceAnimation.values = [1.0, 1.4, 0.9, 1.02, 1.0]
        bounceAnimation.duration = TimeInterval(0.3)
        bounceAnimation.calculationMode = CAAnimationCalculationMode.cubic
        return bounceAnimation
    }()

    // MARK: - Override

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
