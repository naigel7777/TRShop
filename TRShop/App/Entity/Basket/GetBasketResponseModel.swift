//
//  GetBasketResponseModel.swift
//  TRShop
//
//  Created by Nail Safin on 02.03.2021.
//


import Foundation

// MARK: - GetBasketResponseModel
struct GetBasketResponseModel: Codable {
    let amount, countGoods: Int
    let contents: [Content]
}

// MARK: - Content
struct Content: Codable {
    let idProduct: Int
    let productName: String
    let price, quantity: Int

    enum CodingKeys: String, CodingKey {
        case idProduct = "id_product"
        case productName = "product_name"
        case price, quantity
    }
}
