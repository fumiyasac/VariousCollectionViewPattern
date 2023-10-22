//
//  NSObjectProtocolExtension.swift
//  VariousCollectionViewPattern
//
//  Created by 酒井文也 on 2023/10/22.
//

import Foundation

// NSObjectProtocolの拡張
extension NSObjectProtocol {

    // クラス名を返す変数"className"を返す
    static var className: String {
        return String(describing: self)
    }
}
