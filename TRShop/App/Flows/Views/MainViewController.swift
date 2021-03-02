//
//  MainViewController.swift
//  TRShop
//
//  Created by Nail Safin on 13.02.2021.
//

import UIKit

class MainViewController: UIViewController {
    //MARK: Properties
    
    let requestFactory = RequestFactory()
    public var user:User = User(id: 111, login: "", name: "", lastname: "")
    public var registrationData = RegistrationData(idUser: 123, username: "Someone", password: "mypassword", email: "some@some.ru", gender: "m", creditCard: "9872389-2424-234224-234", bio: "This is good! I think I will switch to another language")
    
    
    // MARK: Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testRequests()
        
        
    }
    
    
    //MARK: - Handlers
    func testRequests() {
        let auth = requestFactory.makeAuthRequestFatory()
        auth.login(userName: "Somebody", password: "mypassword") { response in
            switch response.result {
            case .success(let login):
                print(login)
                self.user = login.user
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        let logout = requestFactory.makeLogOutRequestFactorty()
        logout.logOut(userID: user.id) { response in
            switch response.result {
            case .success(let res):
                print(res)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        let registration = requestFactory.getRegistration()
        registration.registration(userId: user.id, userName: registrationData.username, password: registrationData.password, email: registrationData.email, gender: registrationData.gender, creditCard: registrationData.creditCard, bio: registrationData.bio) { (response) in
            switch response.result {
            case .success(let res):
                print(res)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        let changeRegistration = requestFactory.changeRegistration()
        changeRegistration.changeRegistrationInfo(userId: registrationData.idUser, userName: registrationData.username, password: registrationData.password, email: registrationData.email, gender: registrationData.gender, creditCard: registrationData.creditCard, bio: registrationData.bio) { (response) in
            switch response.result {
            case .success(let res):
                print(res)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        let getCatalog = requestFactory.getAllCatalog()
        getCatalog.getAllCatalog(page: 1, id: 1) { (response) in
            switch response.result {
            case .success(let res):
                print(res)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        let getProduct = requestFactory.getProduct()
        getProduct.getProduct(productId: 123) { (response) in
            switch response.result {
            case .success(let res):
                print(res)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        let newComment = requestFactory.editingReview()
        newComment.addRewiew(idUser: user.id, text: "Test Comment") { (response) in
            switch response.result {
            case .success(let res):
                print(res)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        let applyComment = requestFactory.editingReview()
        applyComment.approveReview(commentId: 123) { (response) in
            switch response.result {
            case .success(let res):
                print(res)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        let delComment = requestFactory.editingReview()
        delComment.removeReview(commentId: 123){ (response) in
            switch response.result {
            case .success(let res):
                print(res)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        let addToBasket = requestFactory.basketEditor()
        addToBasket.addToBasket(productID: 123, quantity: 1) { (response) in
            switch response.result {
            case .success(let res):
                print(res)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        let deleteFromBasket = requestFactory.basketEditor()
        deleteFromBasket.deleteFromBasket(productID: 123) { (response) in
            switch response.result {
            case .success(let res):
                print(res)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        let getAllBasket = requestFactory.basketEditor()
        getAllBasket.getBasket(userID: user.id) { (response) in
            switch response.result {
            case .success(let res):
                print(res)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: - Navigation
    
    
    
    
}
