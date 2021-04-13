//
//  UserInfoViewController.swift
//  TRShop
//
//  Created by Nail Safin on 22.03.2021.
//

import UIKit

class UserInfoViewController: UIViewController {
    //MARK: Properties

    let userInfoView: UserInfoView = {
        return $0
    }(UserInfoView())
    var user: User
    let requestFactory: RequestFactory
    let errorAlert = ErrorAlerts()
    
    // MARK: Init
    init(requestfactory: RequestFactory, user: User) {
        self.requestFactory = requestfactory
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = userInfoView
        userInfoView.delegate = self
    }
    

    //MARK: - Handlers
    

    // MARK: - Navigation


    

}
//MARK: - Extensions
extension UserInfoViewController: UserInfoDelegate {
    func getUserInfo(user: User) {
        print("")
    }
    

}
