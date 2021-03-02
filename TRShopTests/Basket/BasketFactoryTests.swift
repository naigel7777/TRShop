//
//  BasketFactoryTests.swift
//  TRShopTests
//
//  Created by Nail Safin on 02.03.2021.
//

import XCTest
@testable import TRShop
import Alamofire

class BasketFactoryTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    //MARK: - Positive Test -- Add New Product In Basket
    func test_AddNewProduct() throws {
//Given
        let baseURL =  try XCTUnwrap(URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/"))
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let session = Session(configuration: configuration)
        
        let basketManager = BasketEditor(errorParser: ErrorParser(), sessionManager: session, queue: DispatchQueue.global(qos: .default), baseURL: baseURL)
//When
        let addProduct = expectation(description: "add new product in basket")
        
        basketManager.addToBasket(productID: 123, quantity: 1) { (response) in
//Then
            
            switch response.result {
            case .success(let reg):
                XCTAssertEqual(reg.result, 1)
                addProduct.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 2)
    }
    //MARK: - Positive Test -- Delete Product From Basket
    func test_DeleteProduct() throws {
//Given
        let baseURL =  try XCTUnwrap(URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/"))
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let session = Session(configuration: configuration)
        
        let basketManager = BasketEditor(errorParser: ErrorParser(), sessionManager: session, queue: DispatchQueue.global(qos: .default), baseURL: baseURL)
//When
        let deleteProduct = expectation(description: "deleted product from basket")
        
        basketManager.deleteFromBasket(productID: 123) { (response) in
//Then
            
            switch response.result {
            case .success(let reg):
                XCTAssertEqual(reg.result, 1)
                deleteProduct.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 2)
    }

    //MARK: - Positive Test -- Get All Basket
    func test_GetAllBasket() throws {
//Given
        let baseURL =  try XCTUnwrap(URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/"))
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let session = Session(configuration: configuration)
        
        let basketManager = BasketEditor(errorParser: ErrorParser(), sessionManager: session, queue: DispatchQueue.global(qos: .default), baseURL: baseURL)
//When
        let getBasket = expectation(description: "get all items from basket")
        
        basketManager.getBasket(userID: 123) { (response) in
//Then
            
            switch response.result {
            case .success(let reg):
                XCTAssertEqual(reg.amount, 46600)
                XCTAssertEqual(reg.countGoods, 2)
                XCTAssertEqual(reg.contents.count, reg.countGoods)
                getBasket.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 2)
    }
    
    //MARK: - Negative Test
    
    func test_WrongUrlBasket() throws {
        //Given
 
        let baseURL =  try XCTUnwrap(URL(string: "https://wrongURL.com"))
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let session = Session(configuration: configuration)
        
        let basketManager = BasketEditor(errorParser: ErrorParser(), sessionManager: session, queue: DispatchQueue.global(qos: .default), baseURL: baseURL)
        let failedBasket = expectation(description: "failed add new product")
        
        basketManager.addToBasket(productID: 123, quantity: 1) { (response) in
            //Then
            
            switch response.result {
            case .success(let reg):
                XCTFail("maust be failed : \(reg)")
            case .failure:
                failedBasket.fulfill()
            }
        }
        waitForExpectations(timeout: 2)
    }
}
