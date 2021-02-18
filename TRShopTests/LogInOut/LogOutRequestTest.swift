//
//  LogOutRequestTest.swift
//  TRShopTests
//
//  Created by Nail Safin on 17.02.2021.
//

import XCTest
@testable import TRShop
import Alamofire

class LogOutRequestTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func test_LogOut() throws {
//Given
        let baseURL =  try XCTUnwrap(URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/"))
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let session = Session(configuration: configuration)
        
        let logout = LogOutRequest(errorParser: ErrorParser(), sessionManager: session, queue: DispatchQueue.global(qos: .default), baseURL: baseURL)
//When
        let loggedOut = expectation(description: "LogOuted")
        
        logout.logOut(userID: 123) { (response) in
//Then
            
            switch response.result {
            case .success(let loggOut):
                XCTAssertEqual(loggOut.result, 1)
                loggedOut.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 2)
    }
    
    
    //MARK: - Negative Test
    
    func test_WrongUrlLogOut() throws {
        //Given
                let baseURL =  try XCTUnwrap(URL(string: "https://wrongURL.com"))
                let configuration = URLSessionConfiguration.default
                configuration.httpShouldSetCookies = false
                configuration.headers = .default
                let session = Session(configuration: configuration)
                
        let logout = LogOutRequest(errorParser: ErrorParser(), sessionManager: session, queue: DispatchQueue.global(qos: .default), baseURL: baseURL)
        //When
                let failedLogIn = expectation(description: "failed logOut")
                
        logout.logOut(userID: 123) { (response) in
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

