//
//  CatalogModel.swift
//  TRShop
//
//  Created by Nail Safin on 18.02.2021.
//

import Foundation
// MARK: - CatalogModel
struct CatalogModelElement: Codable {
    let idProduct: Int
    let productName: String
    let price: Int

    enum CodingKeys: String, CodingKey {
        case idProduct = "id_product"
        case productName = "product_name"
        case price
    }
}

//typealias CatalogModel = [CatalogModelElement]


