//
//  RequestFactory.swift
//  TRShop
//
//  Created by Nail Safin on 13.02.2021.
//

import Foundation
import Alamofire

class RequestFactory {
    
    let baseURL = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    
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
        return Auth(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue, baseURL: baseURL)
    }
    
    func makeLogOutRequestFactorty() -> LogOutRequestFactory {
        let errorParser = makeErrorParser()
        return LogOutRequest(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue, baseURL: baseURL)
    }
    
    func getRegistration() -> RegistrationFactory {
        let errorParser = makeErrorParser()
        return RegistrationInfo(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue, baseURL: baseURL)
    }
    
    func changeRegistration() -> RegistrationFactory {
        let errorParser = makeErrorParser()
        return RegistrationInfo(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue, baseURL: baseURL)
    }
    
    func getAllCatalog() -> CatalogProductsFactory {
        let errorParser = makeErrorParser()
        return CatalogProducts(errorParser: errorParser, sessionManager: commonSession
                               , queue: sessionQueue, baseURL: baseURL)
    }
    
    func getProduct() -> CatalogProductsFactory {
        let errorParser = makeErrorParser()
        return CatalogProducts(errorParser: errorParser, sessionManager: commonSession
                               , queue: sessionQueue, baseURL: baseURL)
    }
    
}
