//
//  FeaturedCategoryEntity.swift
//  VariousCollectionViewPattern
//
//  Created by 酒井文也 on 2023/05/23.
//

import Foundation

struct FeaturedCategoryEntity {

    // MARK: - Property
    
    let id: Int
    let name: String

    // MARK: - Initializer

    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}
