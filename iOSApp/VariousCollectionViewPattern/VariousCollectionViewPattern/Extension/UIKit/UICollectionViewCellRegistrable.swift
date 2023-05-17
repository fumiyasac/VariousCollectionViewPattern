//
//  UICollectionViewCellRegistrable.swift
//  VariousCollectionViewPattern
//
//  Created by 酒井文也 on 2023/03/20.
//

import Foundation
import UIKit

// MARK: - DynamicRegistrable

protocol DynamicRegistrable: UICollectionViewCell {
    associatedtype Item
    static var cellNib: UINib { get }
    static func makeCellRegistration() -> UICollectionView.CellRegistration<Self, Item>
    func configure(_ cellViewObject: Item)
}

extension DynamicRegistrable {
    static func makeCellRegistration() -> UICollectionView.CellRegistration<Self, Item> {
        // MEMO: Cell要素をInitializeする場合の処理に必要なもの
        // 1. Cell用のUINibインスタンス
        // 2. Cell内に定義したtypealiasに設定したItem用構造体 👉 この中にCell内に表示するデータが入っている
        return UICollectionView.CellRegistration.init(
            cellNib: cellNib,
            handler: { cell, _, item in
                cell.configure(item)
            }
        )
    }
}

// MARK: - StaticRegistrable

protocol StaticRegistrable: UICollectionViewCell {
    static var cellNib: UINib { get }
    static func makeCellRegistration() -> UICollectionView.CellRegistration<Self, String>
}

extension StaticRegistrable {
    static func makeCellRegistration() -> UICollectionView.CellRegistration<Self, String> {
        // MEMO: Cell要素をInitializeする場合の処理に必要なもの
        // 1. Cell用のUINibインスタンス
        // 2. この場合はCell表示に必要なものは特にないので省略して問題ない
        return UICollectionView.CellRegistration.init(
            cellNib: cellNib,
            handler: { _, _, _ in
                // Do Nothing.
            }
        )
    }
}

// MARK: - SupplementaryRegistrable

protocol SupplementaryRegistrable: UICollectionReusableView {
    static var supplementaryNib: UINib { get }
    static func makeSupplementaryRegistration(elementKind: String) -> UICollectionView.SupplementaryRegistration<Self>
}

extension SupplementaryRegistrable {

    // MEMO: Cell要素をInitializeする場合の処理に必要なもの
    // 1. Cell用のUINibインスタンス
    // 2. 引数: elementKindの部分には「UICollectionView.elementKindSectionHeader」or「UICollectionView.elementKindSectionFooter」を設定
    // 注意点: CellRegistrationの様にItemに相当するものがないので、値を反映させる際にはこのViewに定義したインスタンスメソッドを介して実施する
    static func makeSupplementaryRegistration(elementKind: String) -> UICollectionView.SupplementaryRegistration<Self> {
        return UICollectionView.SupplementaryRegistration.init(
            supplementaryNib: supplementaryNib,
            elementKind: elementKind,
            handler: { _, _, _ in
                // Do Nothing.
            }
        )
    }
}
