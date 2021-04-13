//
//  RegistrationViewDelegate.swift
//  TRShop
//
//  Created by Nail Safin on 17.03.2021.
//

import Foundation

protocol RegistrationViewDelegate: class {
    func goBacktoLoginView()
    func registerNewUser(userId: String, userName: String, password: String, email: String, gender: String, creditCard: String, bio: String)
}
