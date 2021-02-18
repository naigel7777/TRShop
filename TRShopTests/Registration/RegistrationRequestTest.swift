//
//  RegistrationRequestTest.swift
//  TRShopTests
//
//  Created by Nail Safin on 17.02.2021.
//

import XCTest
@testable import TRShop
import Alamofire

class RegistrationRequestTest: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_Registation() throws {
        //Given
        let registrationData = RegistrationData(idUser: 123, username: "Someone", password: "mypassword", email: "some@some.ru", gender: "m", creditCard: "9872389-2424-234224-234", bio: "This is good! I think I will switch to another language")
        let baseURL =  try XCTUnwrap(URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/"))
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let session = Session(configuration: configuration)
        
        let registration = RegistrationInfo(errorParser: ErrorParser(), sessionManager: session, queue: DispatchQueue.global(qos: .default), baseURL: baseURL)
        //When
        let register = expectation(description: "Registration done")
        
        registration.registration(userId: registrationData.idUser, userName: registrationData.username, password: registrationData.password, email: registrationData.email, gender: registrationData.gender, creditCard: registrationData.creditCard, bio: registrationData.bio) { (response) in
            //Then
            
            switch response.result {
            case .success(let reg):
                XCTAssertEqual(reg.result, 1)
                XCTAssertEqual(reg.userMessage, "Регистрация прошла успешно!")
                register.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 2)
    }
    
    
    //MARK: - Negative Test
    
    func test_WrongUrlRegistration() throws {
        //Given
        let registrationData = RegistrationData(idUser: 123, username: "Someone", password: "mypassword", email: "some@some.ru", gender: "m", creditCard: "9872389-2424-234224-234", bio: "This is good! I think I will switch to another language")
        let baseURL =  try XCTUnwrap(URL(string: "https://wrongURL.com"))
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let session = Session(configuration: configuration)
        
        let registration = RegistrationInfo(errorParser: ErrorParser(), sessionManager: session, queue: DispatchQueue.global(qos: .default), baseURL: baseURL)
        //When
        let failedRegistration = expectation(description: "failed registration")
        
        registration.registration(userId: registrationData.idUser, userName: registrationData.username, password: registrationData.password, email: registrationData.email, gender: registrationData.gender, creditCard: registrationData.creditCard, bio: registrationData.bio) { (response) in
            //Then
            
            switch response.result {
            case .success(let reg):
                XCTFail("maust be failed : \(reg)")
            case .failure:
                failedRegistration.fulfill()
            }
        }
        waitForExpectations(timeout: 2)
    }
    
}
