//
//  ProductModel.swift
//  TRShop
//
//  Created by Nail Safin on 18.02.2021.
//

import Foundation
// MARK: - ProductModel
struct ProductModel: Codable {
    let result: Int
    let productName: String
    let productPrice: Int
    let productDescription: String

    enum CodingKeys: String, CodingKey {
        case result
        case productName = "product_name"
        case productPrice = "product_price"
        case productDescription = "product_description"
    }
}
