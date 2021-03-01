//
//  AuthRequestTest.swift
//  TRShopTests
//
//  Created by Nail Safin on 17.02.2021.
//

import XCTest
@testable import TRShop
import Alamofire

class AuthRequestTest: XCTestCase {

//MARK: - Positive Test
    
    func test_LogIn() throws {
//Given
        let baseURL =  try XCTUnwrap(URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/"))
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let session = Session(configuration: configuration)
        
        let auth = Auth(errorParser: ErrorParser(),
                        sessionManager: session,
                        queue: DispatchQueue.global(qos: .default),
                        baseURL: baseURL)
//When
        let loggedIn = expectation(description: "aalredy logged")
        
        auth.login(userName: "Somebody", password: "password") { (response) in
//Then
            
            switch response.result {
            case .success(let logged):
                XCTAssertEqual(logged.result, 1)
                XCTAssertEqual(logged.user.id, 123)
                XCTAssertEqual(logged.user.name, "John")
                XCTAssertEqual(logged.user.lastname, "Doe")
                loggedIn.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 2)
    }
    
    
    //MARK: - Negative Test
    
    func test_WrongUrlLogIn() throws {
        //Given
                let baseURL =  try XCTUnwrap(URL(string: "https://wrongURL.com"))
                let configuration = URLSessionConfiguration.default
                configuration.httpShouldSetCookies = false
                configuration.headers = .default
                let session = Session(configuration: configuration)
                
                let auth = Auth(errorParser: ErrorParser(),
                                sessionManager: session,
                                queue: DispatchQueue.global(qos: .default),
                                baseURL: baseURL)
        //When
                let failedLogIn = expectation(description: "failed login")
                
                auth.login(userName: "Somebody", password: "password") { (response) in
        //Then
                    
                    switch response.result {
                    case .success(let logged):
                     XCTFail("maust be failed : \(logged)")
                    case .failure:
                        failedLogIn.fulfill()
                    }
                }
                waitForExpectations(timeout: 2)
            }
    
    
}
