//
//  LogOutRequestFactory.swift
//  TRShop
//
//  Created by Nail Safin on 13.02.2021.
//

import Foundation
import Alamofire

protocol LogOutRequestFactory {
    func logOut(userID: Int, completionHandler: @escaping (AFDataResponse<LogOut>) -> Void)
}

class LogOutRequest: AbstractRequestFactory {
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

extension LogOutRequest: LogOutRequestFactory {
    func logOut(userID: Int, completionHandler: @escaping (AFDataResponse<LogOut>) -> Void) {
        let requestModel = Out(baseUrl: baseUrl, userId: userID)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension LogOutRequest {
    struct Out: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "logout.json"
        let userId: Int
        var parameters: Parameters? {
            return [
                "user_id": userId,
               
            ]
        }
    }
}
