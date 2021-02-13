//
//  RequestFactory.swift
//  TRShop
//
//  Created by Nail Safin on 13.02.2021.
//

import Foundation
import Alamofire

class RequestFactory {
    
    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParser()
    }
    
    lazy var commonSession: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        return manager
    }()
    
    let sessionQueue = DispatchQueue.global(qos: .utility)
    
    func makeAuthRequestFatory() -> AuthRequestFactory {
        let errorParser = makeErrorParser()
        return Auth(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeLogOutRequestFactorty() -> LogOutRequestFactory {
        let errorParser = makeErrorParser()
        return LogOutRequest(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func getRegistration() -> RegistrationFactory {
        let errorParser = makeErrorParser()
        return RegistrationInfo(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func changeRegistration() -> RegistrationFactory {
        let errorParser = makeErrorParser()
        return RegistrationInfo(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
}
