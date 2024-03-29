//
//  AppDelegate.swift
//  VariousCollectionViewPattern
//
//  Created by 酒井文也 on 2023/03/18.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: -  Function

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        // MEMO: iOS15以降で適用するUINavigationController/UITabBarControllerの見た目に関する設定を適用する
        setupNavigationBarAppearance()
        setupTabBarAppearance()

        return true
    }

    // MARK: - UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        //
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        //
    }

    // MARK: - Private Function

    private func setupNavigationBarAppearance() {

        // iOS15以降ではUINavigationBarの配色指定方法が変化する点に注意する
        // https://shtnkgm.com/blog/2021-08-18-ios15.html

        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()

        // MEMO: UINavigationBar内部におけるタイトル文字の装飾設定
        navigationBarAppearance.titleTextAttributes = [
            NSAttributedString.Key.font : UIFont(name: "HelveticaNeue-Bold", size: 14.0)!,
            NSAttributedString.Key.foregroundColor : UIColor.white
        ]

        // MEMO: UINavigationBar背景色の装飾設定
        navigationBarAppearance.backgroundColor = UIColor(code: "#f5b2b2")

        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
    }

    private func setupTabBarAppearance() {

        // iOS15以降でiOS14以前と同じUINavigationBarの配色指定方法が変化する点に注意する
        // https://shtnkgm.com/blog/2021-08-18-ios15.html
        let tabBarAppearance = UITabBarAppearance()
        let tabBarItemAppearance = UITabBarItemAppearance()

        // UITabBarItemの選択時と非選択時の文字色の装飾設定
        tabBarItemAppearance.normal.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.lightGray
            
        ]
        tabBarItemAppearance.selected.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor(code: "#f5b2b2")
        ]
        tabBarAppearance.stackedLayoutAppearance = tabBarItemAppearance

        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    }
}

// MARK: - Global Function For Testing

func isTesting() -> Bool {
    return NSClassFromString("XCTest") != nil
}
