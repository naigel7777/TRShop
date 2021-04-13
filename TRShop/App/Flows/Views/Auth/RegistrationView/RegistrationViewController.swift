//
//  RegistrationViewController.swift
//  TRShop
//
//  Created by Nail Safin on 15.03.2021.
//

import UIKit

class RegistrationViewController: UIViewController {
    //MARK: Properties

    let registrationView: RegistrationView = {
        return $0
    }(RegistrationView())
    
    let requestFactory: RequestFactory
    let errorAlert = ErrorAlerts()
    
    // MARK: Init
    init(requestfactory: RequestFactory) {
        self.requestFactory = requestfactory
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = registrationView
        registrationView.delegate = self
    }
    

    //MARK: - Handlers
    

    // MARK: - Navigation


    

}
//MARK: - Extensions
extension RegistrationViewController: RegistrationViewDelegate {
    func goBacktoLoginView(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func registerNewUser(userId: String, userName: String, password: String, email: String, gender: String, creditCard: String, bio: String) {
        if userId.isEmpty || userName.isEmpty || password.isEmpty || email.isEmpty || creditCard.isEmpty || bio.isEmpty {
            errorAlert.showRegisterError(vc: self)
        } else {
            guard let userid = Int(userId)
            else {
                return errorAlert.showIDError(vc: self)
            }
            let registration = requestFactory.getRegistration()
            registration.registration(userId: userid, userName: userName, password: password, email: email, gender: gender, creditCard: creditCard, bio: bio) { (response) in
                switch response.result {
                case .success(let res):
                    if res.result == 1 {
                        DispatchQueue.main.async {
                            self.errorAlert.showRegisterSuccess(vc: self, message: res.userMessage)
                        }
                    } else {
                        DispatchQueue.main.async {
                            self.errorAlert.showRegisterError(vc: self)
                        }
                    }
                case .failure(let error):
                    self.errorAlert.showNetworkError(vc: self, message: "Network issue, please try later")
                    print(error.localizedDescription)
                }
            }
        }
        
        
    }
}
