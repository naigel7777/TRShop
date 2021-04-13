//
//  LoginView.swift
//  TRShop
//
//  Created by Nail Safin on 11.03.2021.
//

import Foundation
import UIKit
import PinLayout

class LoginView: UIView {
    //MARK: Properties
    
    weak var delegate: LoginViewDelegate?
    
    let backgroundView: UIView = {
        $0.backgroundColor = .black
        let backgroundImage: UIImageView = {
            $0.image = UIImage(named: "gradient")
            $0.clipsToBounds = true
            $0.contentMode = .scaleAspectFill
            $0.backgroundColor = .black
            $0.frame = CGRect(x: 0, y: 0, width: 1600, height: 1200)
        
            return $0
        }(UIImageView())
        $0.addSubview(backgroundImage)
        $0.bringSubviewToFront(backgroundImage)
        return $0
    }(UIView())
    
    

    
    let logoIcon: UIImageView = {
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.backgroundColor = .clear
        $0.image = UIImage(named: "logoTRShop")
        $0.layer.cornerRadius = 10.0
        return $0
    }(UIImageView())
    
    let signInLabel: UILabel = {
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 20)
        $0.textAlignment = .center
        $0.text = "SIGN IN"
        return $0
    }(UILabel())
    
    let bluredLayer: UIView = {
        $0.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        $0.layer.cornerRadius = 4.0
        return $0
    }(UIView())
    
    let loginLabel: UILabel = {
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.textAlignment = .center
        $0.text = "Login"
        return $0
    }(UILabel())
    
    let loginTextField: UITextField = {
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.placeholder = "Enter your login"
        $0.borderStyle = UITextField.BorderStyle.roundedRect
        $0.autocorrectionType = UITextAutocorrectionType.no
        $0.keyboardType = UIKeyboardType.default
        $0.returnKeyType = UIReturnKeyType.done
        $0.clearButtonMode = UITextField.ViewMode.whileEditing
        $0.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return $0
    }(UITextField())
    
    let passwordLabel: UILabel = {
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.textAlignment = .center
        $0.text = "Password"
        return $0
    }(UILabel())
    
    let passwordTextField: UITextField = {
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.clipsToBounds = true
        $0.placeholder = "Enter your password"
        $0.borderStyle = UITextField.BorderStyle.roundedRect
        $0.autocorrectionType = UITextAutocorrectionType.no
        $0.keyboardType = UIKeyboardType.default
        $0.returnKeyType = UIReturnKeyType.done
        $0.clearButtonMode = UITextField.ViewMode.whileEditing
        $0.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
     
        return $0
    }(UITextField())
    
    let registerButton: UIButton = {
        
        $0.tintColor = UIColor.blue
        $0.setTitle("or Register as a new user", for: .normal)
        $0.setTitleColor(.systemBlue, for: .normal)
        $0.setTitleColor(.white, for: .highlighted)
        return $0
    }(UIButton())
    
    let loginButton: UIButton = {
        $0.backgroundColor = .systemIndigo
        $0.setTitle("Login", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.setTitleColor(.systemIndigo, for: .highlighted)
        $0.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        $0.layer.shadowOffset = CGSize(width: 1.0, height: 2.0)
        $0.layer.shadowOpacity = 2.0
        $0.layer.shadowRadius = 0.0
        $0.layer.masksToBounds = false
        $0.layer.cornerRadius = 8.0
        
        return $0
    }(UIButton())
    
  
    // MARK: Init

    override func layoutSubviews() {
        super.layoutSubviews()
        loginLayouts()
        
    }

    //MARK: - Handlers
    
    func loginLayouts() {
        let margin: CGFloat = 20
        self.backgroundColor = .black
        backgroundView.pin(to: self)
            .all()
        
        logoIcon.pin(to: backgroundView)
            .size(100)
            .topCenter(40)
        signInLabel.pin(to: backgroundView)
            .below(of: logoIcon, aligned: .center)
            .size(CGSize(width: 100, height: 30))
        
        bluredLayer.pin(to: backgroundView)
            .below(of: signInLabel, aligned: .center)
            .margin(margin)
            .size(CGSize(width: backgroundView.frame.size.width - margin, height: 90))
        
        
        loginLabel.pin(to: bluredLayer)
            .size(CGSize(width: 100, height: 30))
            .topLeft(10)
        loginTextField.pin(to: bluredLayer)
            .after(of: loginLabel)
            .size(CGSize(width: bluredLayer.frame.width - 120, height: 30))
            .top(10)
        passwordLabel.pin(to: bluredLayer)
            .below(of: loginLabel,aligned: .center)
            .margin(10)
            .size(CGSize(width: 100, height: 30))
        
        passwordTextField.pin(to: bluredLayer)
            .after(of: passwordLabel)
            .size(CGSize(width: bluredLayer.frame.width - 120, height: 30))
            .bottom(10)
        registerButton.pin(to: backgroundView)
            .below(of: bluredLayer, aligned: .center)
            .margin(margin)
            .size(CGSize(width: 250, height: 30))
        
        loginButton.pin(to: backgroundView)
            .below(of: registerButton, aligned: .center)
            .margin(margin)
            .size(CGSize(width: 150, height: 30))
        
        registerButton.addTarget(self, action: #selector(goToRegistration), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(checkLogin), for: .touchUpInside)

    }
    
    @objc func goToRegistration() {
        print("Register tapped \(String(describing: loginTextField.text))")
        delegate?.goToRegistration()
    
        
    }
    
    @objc func checkLogin() {
        delegate?.checkLogin(login: loginTextField.text ?? "", pass: passwordTextField.text ?? "")
     
    }
    
}
