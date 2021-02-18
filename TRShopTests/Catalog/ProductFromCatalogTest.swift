//
//  ProductFromCatalogTest.swift
//  TRShopTests
//
//  Created by Nail Safin on 18.02.2021.
//

import XCTest
@testable import TRShop
import Alamofire

class ProductFromCatalogTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_ProductRequest() throws {
        //Given
        let baseURL =  try XCTUnwrap(URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/"))
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let session = Session(configuration: configuration)
        
        let catalog = CatalogProducts(errorParser: ErrorParser(), sessionManager: session, queue: DispatchQueue.global(qos: .default), baseURL: baseURL)
        //When
        let getProduct = expectation(description: "getting product is done")
        
        catalog.getProduct(productId: 123) { (response) in
            //Then
            
            switch response.result {
            case .success(let reg):
                XCTAssertEqual(reg.result, 1)
                XCTAssertEqual(reg.productName, "Ноутбук")
                XCTAssertEqual(reg.productPrice, 45600)
                getProduct.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 2)
    }
    
    
    //MARK: - Negative Test
    
    func test_WrongUrlProduct() throws {
        //Given
 
        let baseURL =  try XCTUnwrap(URL(string: "https://wrongURL.com"))
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let session = Session(configuration: configuration)
        
        let catalog = CatalogProducts(errorParser: ErrorParser(), sessionManager: session, queue: DispatchQueue.global(qos: .default), baseURL: baseURL)
        let failedProduct = expectation(description: "failed geting product")
        
        catalog.getProduct(productId: 123){ (response) in
            //Then
            
            switch response.result {
            case .success(let reg):
                XCTFail("maust be failed : \(reg)")
            case .failure:
                failedProduct.fulfill()
            }
        }
        waitForExpectations(timeout: 2)
    }

}
