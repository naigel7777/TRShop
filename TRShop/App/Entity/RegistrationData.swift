//
//  RegistrationData.swift
//  TRShop
//
//  Created by Nail Safin on 13.02.2021.
//

import Foundation
struct RegistrationData: Codable {
    let idUser: Int
    let username, password, email, gender: String
    let creditCard, bio: String
    
    enum CodingKeys: String, CodingKey {
        case idUser = "id_user"
        case username, password, email, gender
        case creditCard = "credit_card"
        case bio
    }

}
