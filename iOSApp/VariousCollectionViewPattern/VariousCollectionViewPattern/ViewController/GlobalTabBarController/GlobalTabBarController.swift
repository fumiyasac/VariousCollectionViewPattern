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
    enum TabBarItems: CaseIterable {

        case main
        case search
        case favorite
        case setting

        // MARK: - Function

        // 配置するタイトルを取得する
        func getTitle() -> String {
            switch self {
            case .main:
                return "ファッション集め"
            case .search:
                return "アイテム検索"
            case .favorite:
                return "お気に入り"
            case .setting:
                return "アプリ設定"
            }
        }

        // 配置するSF Symbolsのアイコン名前を取得する
        func getSymbolName() -> String {
            switch self {
            case .main:
                return "books.vertical.circle.fill"
            case .search:
                return "magnifyingglass.circle"
            case .favorite:
                return "heart.circle.fill"
            case .setting:
                return "rectangle.stack.fill"
            }
        }
    }

    // MARK: - Properties

    private let itemSize = CGSize(width: 28.0, height: 28.0)
    private let normalColor: UIColor = UIColor.lightGray
    private let selectedColor: UIColor = UIColor(code: "#f5b2b2")
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

        setupGlobalTabBarController()
    }

    // UITabBarItemが押下された際に実行される処理
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {

        // MEMO: UITabBarに配置されているUIImageView要素に対してアニメーションさせるための処理
        // (参考) https://bit.ly/2VCP5Am
        guard let index = tabBar.items?.firstIndex(of: item),
            tabBar.subviews.count > index + 1,
            let imageView = tabBar.subviews[index + 1].subviews[1] as? UIImageView else {
            return
        }
        // MEMO: 抽出したUIImageView要素に対してCoreAnimationを適用する
        imageView.layer.add(bounceAnimation, forKey: nil)
    }

    // MARK: - Private Function

    // UITabBarControllerの初期設定に関する調整
    private func setupGlobalTabBarController() {

        // MEMO: UITabBarControllerDelegateの宣言
        self.delegate = self

        // MEMO: Storyboardを利用したDI処理を実施する
        // https://qiita.com/shtnkgm/items/cad6f52c489612628fd4
        // (1) MainViewController
        let mainViewController = UIStoryboard(name: "MainViewController", bundle: nil)
            .instantiateInitialViewController()!.applyNavigationController()
        // (2) SearchItemViewController
        let searchItemViewController = UIStoryboard(name: "SearchItemViewController", bundle: nil)
            .instantiateInitialViewController()!.applyNavigationController()
        // (3) FavoriteItemViewController
        let favoriteItemViewController = UIStoryboard(name: "FavoriteItemViewController", bundle: nil)
            .instantiateInitialViewController()!.applyNavigationController()
        // (4) SettingViewController
        let settingViewController = UIStoryboard(name: "SettingViewController", bundle: nil)
            .instantiateInitialViewController()!.applyNavigationController()

        // MEMO: 各画面の土台となるUINavigationControllerをセットする
        self.viewControllers = [
            mainViewController,
            searchItemViewController,
            favoriteItemViewController,
            settingViewController
        ]

        // MEMO: タブの選択時・非選択時の色とアイコンのサイズを決める
        // UITabBarItem用のAttributeを決める
        let normalAttributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.font: tabBarItemFont,
            NSAttributedString.Key.foregroundColor: normalColor
        ]
        let selectedAttributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.font: tabBarItemFont,
            NSAttributedString.Key.foregroundColor: selectedColor
        ]

        let _ = TabBarItems.allCases.enumerated().map { (index, tabBarItem) in

            // 該当ViewControllerのタイトルの設定
            self.viewControllers?[index].title = tabBarItem.getTitle()
            // 該当ViewControllerのUITabBar要素の設定
            self.viewControllers?[index].tabBarItem.tag = index
            self.viewControllers?[index].tabBarItem.setTitleTextAttributes(normalAttributes, for: [])
            self.viewControllers?[index].tabBarItem.setTitleTextAttributes(selectedAttributes, for: .selected)
            self.viewControllers?[index].tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0.0, vertical: 0.0)
            self.viewControllers?[index].tabBarItem.image
                = UIImage(
                    systemName: tabBarItem.getSymbolName(),
                    withConfiguration: UIImage.SymbolConfiguration(pointSize: 12, weight: .black)
                    )!.withTintColor(normalColor, renderingMode: .alwaysOriginal)
            self.viewControllers?[index].tabBarItem.selectedImage
                = UIImage(
                    systemName: tabBarItem.getSymbolName(),
                    withConfiguration: UIImage.SymbolConfiguration(pointSize: 12, weight: .black)
                    )!.withTintColor(selectedColor, renderingMode: .alwaysOriginal)
        }
    }
}

// MARK: - UITabBarControllerDelegate

extension GlobalTabBarController: UITabBarControllerDelegate {

    // UITabBarControllerの画面遷移が実行された場合の遷移アニメーションの定義
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return globalTabBarTransition
    }
}
