//
//  LoginViewDelegate.swift
//  TRShop
//
//  Created by Nail Safin on 11.03.2021.
//

import Foundation


protocol LoginViewDelegate: class {
   func goToRegistration()
    func checkLogin(login: String, pass: String)
    
}
