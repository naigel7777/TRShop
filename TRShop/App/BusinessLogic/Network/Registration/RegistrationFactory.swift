//
//  RegistrationFactory.swift
//  TRShop
//
//  Created by Nail Safin on 13.02.2021.
//

import Foundation
import Alamofire
protocol RegistrationFactory {
    func registration(userId: Int, userName: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping (AFDataResponse<RegistrationInformation>) -> Void)
    func changeRegistrationInfo(userId: Int, userName: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping (AFDataResponse<ChangeRegistrationInfo>) -> Void)
}
class RegistrationInfo: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl: URL
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility), baseURL: URL) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
        self.baseUrl = baseURL
    }
}

extension RegistrationInfo: RegistrationFactory {
    func registration(userId: Int, userName: String, password: String, email: String, gender: String, creditCard: String, bio: String,  completionHandler: @escaping (AFDataResponse<RegistrationInformation>) -> Void) {
        let requestModel = Info(baseUrl: baseUrl, path: "registerUser.json", userId: userId, userName: userName, password: password, email: email, gender: gender, creditCard: creditCard, bio: bio)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    func changeRegistrationInfo(userId: Int, userName: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping (AFDataResponse<ChangeRegistrationInfo>) -> Void) {
        let requestModel = Info(baseUrl: baseUrl, path: "changeUserData.json", userId: userId, userName: userName, password: password, email: email, gender: gender, creditCard: creditCard, bio: bio)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension RegistrationInfo {
    struct Info: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String
        
        let userId: Int
        let userName: String
        let password: String
        let email: String
        let gender: String
        let creditCard: String
        let bio: String
        var parameters: Parameters? {
            return [
                "id_user": userId,
                "username": userName,
                "password": password,
                "email": email,
                "gender": gender,
                "credit_card": creditCard,
                "bio": bio
            ]
        }
    }
}
