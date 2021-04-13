//
//  LoginViewController.swift
//  TRShop
//
//  Created by Nail Safin on 11.03.2021.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
      //MARK: Properties
 
  
    let loginView: LoginView = {
        return $0
    }(LoginView())
    
    let requestFactory = RequestFactory()
    let errorAlert = ErrorAlerts()
    var user : User?
    // MARK: Init

    override func viewDidLoad() {
        super.viewDidLoad()
        view = loginView
        loginView.delegate = self
        self.navigationController?.setNavigationBarHidden(true, animated: false)
       
    }
    

    //MARK: - Handlers
    

    // MARK: - Navigation


    

}
extension LoginViewController: LoginViewDelegate {
    func goToRegistration() {
        let registrationVC = RegistrationViewController(requestfactory: requestFactory)
        registrationVC.modalPresentationStyle = .overCurrentContext
        self.navigationController?.present(registrationVC, animated: true, completion: {
        })
    }
    func checkLogin(login: String, pass: String){
        if login.isEmpty || pass.isEmpty  {
            errorAlert.showEditError(vc: self)
        } else {
            let auth = requestFactory.makeAuthRequestFatory()
            auth.login(userName: login, password: pass) { (response) in
                switch response.result {
                case .success(let login):
                    if login.result == 1 {
                        self.user = login.user
                        DispatchQueue.main.async {
                            let containerVC = ContainerViewController(requestfactory: self.requestFactory, user: self.user ?? .zero)
                           containerVC.modalPresentationStyle = .overCurrentContext
                            self.navigationController?.present(containerVC, animated: true, completion: {
                            })
                        }
                    } else {
                        self.errorAlert.showLoginError(vc: self)
                    }
                case .failure(let error):
                    self.errorAlert.showNetworkError(vc: self, message: "Network issue")
                    print(error.localizedDescription)
                }
            }
        }
    }
}
