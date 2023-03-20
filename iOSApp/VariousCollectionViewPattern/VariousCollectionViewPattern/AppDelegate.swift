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

        // MEMO: Dependency Injection用の処理を初期化する
        if isTesting() {
            // 注意: Test実行時はDIコンテナへの登録処理をしない
            // → ●●●Spec内のbeforeEachではテストコードを動作させるのに必要な責務をDIコンテナへ登録
            // → ●●●Spec内のafterEachではテストコードを動作させるのに登録した責務を削除する
            print("Build for Unit Testing Starting...")
        } else {
            print("Build for Debug/Production Starting...")
            let productionDependency = DependenciesDefinition()
            productionDependency.inject()
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        //
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        //
    }
}

// MARK: - Global Function For Testing

func isTesting() -> Bool {
    return NSClassFromString("XCTest") != nil
}
