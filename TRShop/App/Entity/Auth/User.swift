//
//  User.swift
//  TRShop
//
//  Created by Nail Safin on 13.02.2021.
//

import Foundation

struct User: Codable {
    static var zero: User {
        User(id: 0, login: "", name: "", lastname: "")
    }
    let id: Int
    let login: String
    let name: String
    let lastname: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id_user"
        case login = "user_login"
        case name = "user_name"
        case lastname = "user_lastname"
    }
}
