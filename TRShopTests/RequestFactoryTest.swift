//
//  RequestFactoryTest.swift
//  TRShopTests
//
//  Created by Nail Safin on 17.02.2021.
//

import XCTest
@testable import TRShop
import Alamofire

class RequestFactoryTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_Logging() throws {
        
        //Given
        let requestFactory = RequestFactory()
        let auth = requestFactory.makeAuthRequestFatory()
        
        
        //When
        let signedIn = expectation(description: "signed in")
        auth.login(userName: "Somebody", password: "mypassword") { response in
            
        //Then
            switch response.result {
            case .success(let login):
                XCTAssertEqual(login.user.id, 123)
                signedIn.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: 2)
    }

}
