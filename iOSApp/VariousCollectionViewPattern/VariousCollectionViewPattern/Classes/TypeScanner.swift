//
//  TypeScanner.swift
//  VariousCollectionViewPattern
//
//  Created by 酒井文也 on 2023/03/20.
//

import Foundation

final class TypeScanner {

    // MARK: - Static Function

    static func getName<T>(_ type: T) -> String {
        return NSString(string: "\(type)").components(separatedBy: ".").last!
    }
}
