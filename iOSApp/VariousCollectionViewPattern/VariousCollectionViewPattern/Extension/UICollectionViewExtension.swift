//
//  UICollectionViewExtension.swift
//  VariousCollectionViewPattern
//
//  Created by 酒井文也 on 2023/03/20.
//

import Foundation
import UIKit

// UICollectionReusableViewの拡張
extension UICollectionReusableView {
    
    // 独自に定義したセルのクラス名を返す
    static var identifier: String {
        return className
    }

    // 作成した独自のカスタムセルのNib(UINib)のインスタンスを返すメソッド
    // 👉 UICollectionViewCellRegistrableに定義した各種拡張メソッドで利用する
    // 👉 UICollectionViewCellクラスはUICollectionReusableViewを継承しているのでUICollectionViewCellでも利用可能
    static func makeNibResource<T: UICollectionReusableView>(_ viewType: T.Type) -> UINib {
        return UINib(nibName: T.identifier, bundle: nil)
    }
}

// UICollectionViewの拡張
extension UICollectionView {

    // 作成した独自のカスタムセルを初期化するメソッド
    func registerCustomCell<T: UICollectionViewCell>(_ cellType: T.Type) {
        register(UINib(nibName: T.identifier, bundle: nil), forCellWithReuseIdentifier: T.identifier)
    }

    // 作成した独自のカスタムヘッダー用のViewを初期化するメソッド
    func registerCustomReusableHeaderView<T: UICollectionReusableView>(_ viewType: T.Type) {
        register(UINib(nibName: T.identifier, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader ,withReuseIdentifier: T.identifier)
    }

    // 作成した独自のカスタムフッター用のViewを初期化するメソッド
    func registerCustomReusableFooterView<T: UICollectionReusableView>(_ viewType: T.Type) {
        register(UINib(nibName: T.identifier, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter ,withReuseIdentifier: T.identifier)
    }

    // 作成した独自のカスタムセルをインスタンス化するメソッド
    func dequeueReusableCustomCell<T: UICollectionViewCell>(with cellType: T.Type, indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as! T
    }

    // 作成した独自のカスタムヘッダー用のViewをインスタンス化するメソッド
    func dequeueReusableCustomHeaderView<T: UICollectionReusableView>(with cellType: T.Type, indexPath: IndexPath) -> T {
        return dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: T.identifier, for: indexPath) as! T
    }

    // 作成した独自のカスタムフッター用のViewをインスタンス化するメソッド
    func dequeueReusableCustomFooterView<T: UICollectionReusableView>(with cellType: T.Type, indexPath: IndexPath) -> T {
        return dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: T.identifier, for: indexPath) as! T
    }
}
