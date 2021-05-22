//
//  CategoriesResponse.swift
//  IbtikatTask
//
//  Created by Ahlam on 21/5/2021.
//

import Foundation
// MARK: - DataClass
class CategoriesResponse: Codable {
    var categories: [CategoryItem]?

    enum CodingKeys: String, CodingKey {
        case categories = "categories"
    }

    init(categories: [CategoryItem]?) {
        self.categories = categories
    }
}

// MARK: - Category
class CategoryItem: Codable {
    var name: String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
    }

    init(name: String?) {
        self.name = name
    }
}
