//
//  ErrorAlerts.swift
//  TRShop
//
//  Created by Nail Safin on 17.03.2021.
//

import Foundation
import UIKit


class ErrorAlerts {
    
    func showEditError(vc: UIViewController) {
        let alter = UIAlertController(title: "Ошибка", message: "Не введен логин или пароль", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alter.addAction(action)
        vc.present(alter, animated: true, completion: nil)
        
    }
    func showRegisterError(vc: UIViewController) {
        let alter = UIAlertController(title: "Ошибка", message: "Не заполнены все поля", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alter.addAction(action)
        vc.present(alter, animated: true, completion: nil)
        
    }
    
    func showRegisterSuccess(vc: UIViewController, message: String) {
        let alter = UIAlertController(title: "Поздравляем !", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default){ _ in
            vc.dismiss(animated: true, completion: nil)
        }
        alter.addAction(action)
        vc.present(alter, animated: true, completion: nil)
        
    }
    
    func showIDError(vc: UIViewController) {
        let alter = UIAlertController(title: "Ошибка", message: "ID может содержать только цифры", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alter.addAction(action)
        vc.present(alter, animated: true, completion: nil)
        
    }
    
    func showNetworkError(vc: UIViewController,message: String){
        let alter = UIAlertController(title: "Упс", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alter.addAction(action)
        vc.present(alter, animated: true, completion: nil)
        
    }
    func showLoginError(vc: UIViewController) {
        let alter = UIAlertController(title: "Ошибка", message: "Не верный логин или пароль", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alter.addAction(action)
        vc.present(alter, animated: true, completion: nil)
        
    }
}
