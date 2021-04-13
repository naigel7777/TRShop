//
//  RegistrationView.swift
//  TRShop
//
//  Created by Nail Safin on 15.03.2021.
//

import UIKit

class RegistrationView: UIView {

    //MARK: Properties
    
    weak var delegate: RegistrationViewDelegate?
    
    let backgroundView: UIView = {
        $0.backgroundColor = .black
        let backgroundImage: UIImageView = {
            $0.image = UIImage(named: "gradient2")
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
        $0.text = "REGISTRATION"
        return $0
    }(UILabel())
    
    let bluredLayer: UIView = {
        $0.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        $0.layer.cornerRadius = 4.0
        return $0
    }(UIView())
    
    let userIDLabel: UILabel = {
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.textAlignment = .center
        $0.text = "ID"
        return $0
    }(UILabel())
    
    let userIDTextField: UITextField = {
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.placeholder = "Enter your ID"
        $0.borderStyle = UITextField.BorderStyle.roundedRect
        $0.autocorrectionType = UITextAutocorrectionType.no
        $0.keyboardType = UIKeyboardType.default
        $0.returnKeyType = UIReturnKeyType.done
        $0.clearButtonMode = UITextField.ViewMode.whileEditing
        $0.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return $0
    }(UITextField())
    
    let userNameLabel: UILabel = {
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.textAlignment = .center
        $0.text = "Username"
        return $0
    }(UILabel())
    
    let userNameTextField: UITextField = {
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.clipsToBounds = true
        $0.placeholder = "Enter your username"
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
    
    let emailLabel: UILabel = {
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.textAlignment = .center
        $0.text = "Email"
        return $0
    }(UILabel())
    
    let emailTextField: UITextField = {
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.clipsToBounds = true
        $0.placeholder = "Enter your Email"
        $0.borderStyle = UITextField.BorderStyle.roundedRect
        $0.autocorrectionType = UITextAutocorrectionType.no
        $0.keyboardType = UIKeyboardType.default
        $0.returnKeyType = UIReturnKeyType.done
        $0.clearButtonMode = UITextField.ViewMode.whileEditing
        $0.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return $0
    }(UITextField())
    
    let genderLabel: UILabel = {
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.textAlignment = .center
        $0.text = "Gender"
        return $0
    }(UILabel())
    
    let genderTextField: UISegmentedControl = {
        $0.selectedSegmentIndex = 0
        $0.backgroundColor = .systemGray
        return $0
    }(UISegmentedControl(items: ["M","W"]))
    
    let creditCardLabel: UILabel = {
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.textAlignment = .center
        $0.text = "Creditcard"
        return $0
    }(UILabel())
    
    let creditCardTextField: UITextField = {
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.clipsToBounds = true
        $0.placeholder = "Enter your creditcard"
        $0.borderStyle = UITextField.BorderStyle.roundedRect
        $0.autocorrectionType = UITextAutocorrectionType.no
        $0.keyboardType = UIKeyboardType.default
        $0.returnKeyType = UIReturnKeyType.done
        $0.clearButtonMode = UITextField.ViewMode.whileEditing
        $0.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return $0
    }(UITextField())
    
    let bioLabel: UILabel = {
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.textAlignment = .center
        $0.text = "Bio"
        return $0
    }(UILabel())
    
    let bioTextField: UITextField = {
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.clipsToBounds = true
        $0.placeholder = "Enter your bio"
        $0.borderStyle = UITextField.BorderStyle.roundedRect
        $0.autocorrectionType = UITextAutocorrectionType.no
        $0.keyboardType = UIKeyboardType.default
        $0.returnKeyType = UIReturnKeyType.done
        $0.clearButtonMode = UITextField.ViewMode.whileEditing
        $0.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return $0
    }(UITextField())
    
    let regButton: UIButton = {
        $0.backgroundColor = .systemIndigo
        $0.setTitle("Register", for: .normal)
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
    
    let cancelButton: UIButton = {
        
        $0.tintColor = UIColor.blue
        $0.setTitle("Cancel", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        $0.setTitleColor(.systemBlue, for: .normal)
        $0.setTitleColor(.white, for: .highlighted)
        return $0
    }(UIButton())
    
    // MARK: Init

    override func layoutSubviews() {
        super.layoutSubviews()
        registrationLayouts()
    }

    //MARK: - Handlers
    
    func registrationLayouts() {
        let margin: CGFloat = 20
        self.backgroundColor = .black
        backgroundView.pin(to: self)
            .all()
        
        logoIcon.pin(to: backgroundView)
            .size(100)
            .topCenter(40)
        signInLabel.pin(to: backgroundView)
            .below(of: logoIcon, aligned: .center)
            .size(CGSize(width: 200, height: 30))
        
        bluredLayer.pin(to: backgroundView)
            .below(of: signInLabel, aligned: .center)
            .margin(margin)
            .size(CGSize(width: backgroundView.frame.size.width - margin, height: 290))
        
       
        userIDLabel.pin(to: bluredLayer)
            .size(CGSize(width: 100, height: 30))
            .topLeft(10)
        userIDTextField.pin(to: bluredLayer)
            .after(of: userIDLabel, aligned: .center)
            .size(CGSize(width: bluredLayer.frame.width - 120, height: 30))
        userNameLabel.pin(to: bluredLayer)
            .below(of: userIDLabel,aligned: .center)
            .margin(10)
            .size(CGSize(width: 100, height: 30))
        userNameTextField.pin(to: bluredLayer)
            .after(of: userNameLabel, aligned: .center)
            .size(CGSize(width: bluredLayer.frame.width - 120, height: 30))
        passwordLabel.pin(to: bluredLayer)
            .below(of: userNameLabel,aligned: .center)
            .margin(10)
            .size(CGSize(width: 100, height: 30))
        passwordTextField.pin(to: bluredLayer)
            .after(of: passwordLabel, aligned: .center)
            .size(CGSize(width: bluredLayer.frame.width - 120, height: 30))
        emailLabel.pin(to: bluredLayer)
            .below(of: passwordLabel,aligned: .center)
            .margin(10)
            .size(CGSize(width: 100, height: 30))
        emailTextField.pin(to: bluredLayer)
            .after(of: emailLabel, aligned: .center)
            .size(CGSize(width: bluredLayer.frame.width - 120, height: 30))
        genderLabel.pin(to: bluredLayer)
            .below(of: emailLabel,aligned: .center)
            .margin(10)
            .size(CGSize(width: 100, height: 30))
        genderTextField.pin(to: bluredLayer)
            .after(of: genderLabel, aligned: .center)
            .size(CGSize(width: bluredLayer.frame.width - 120, height: 30))
        creditCardLabel.pin(to: bluredLayer)
            .below(of: genderLabel,aligned: .center)
            .margin(10)
            .size(CGSize(width: 100, height: 30))
       creditCardTextField.pin(to: bluredLayer)
            .after(of: creditCardLabel, aligned: .center)
            .size(CGSize(width: bluredLayer.frame.width - 120, height: 30))
        bioLabel.pin(to: bluredLayer)
            .below(of: creditCardLabel,aligned: .center)
            .margin(10)
            .size(CGSize(width: 100, height: 30))
       bioTextField.pin(to: bluredLayer)
            .after(of: bioLabel, aligned: .center)
            .size(CGSize(width: bluredLayer.frame.width - 120, height: 30))
        
       regButton.pin(to: backgroundView)
            .below(of: bluredLayer, aligned: .center)
            .margin(margin)
            .size(CGSize(width: 150, height: 30))
        cancelButton.pin(to: backgroundView)
            .below(of: regButton,aligned: .center)
            .margin(margin)
            .size(CGSize(width: 150, height: 30))
 
        regButton.addTarget(self, action: #selector(registrationRequest), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(cancelRegistration), for: .touchUpInside)
    }
    

    
    @objc func registrationRequest() {
 
        delegate?.registerNewUser(userId: userIDTextField.text ?? "", userName: userNameTextField.text ?? "", password: passwordTextField.text ?? "", email: emailTextField.text ?? "", gender: genderTextField.titleForSegment(at: genderTextField.selectedSegmentIndex) ?? "", creditCard: creditCardTextField.text ?? "", bio: bioTextField.text ?? "")
     
    }
    
    @objc func cancelRegistration() {
        delegate?.goBacktoLoginView()
     
    }
}
