//
//  MenuOption.swift
//  TRShop
//
//  Created by Nail Safin on 22.03.2021.
//

import UIKit

enum MenuOption: Int, CustomStringConvertible {
    var description: String {
        switch self {
   
        case .Profile:
            return "Профиль"
        case .Market:
            return "Магазин"
        case .About:
            return "О Нас"
        case .Exit:
            return "Выход"
        }
    }
    var image: UIImage {
        switch self {
   
        case .Profile:
            return UIImage(systemName:"person") ?? UIImage()
        case .Market:
            return UIImage(systemName:"cart") ?? UIImage()
        case .About:
            return UIImage(systemName:"info") ?? UIImage()
        case .Exit:
            return UIImage(systemName:"xmark") ?? UIImage()
        }
    }
    
    case Profile
    case Market
    case About
    case Exit
}
