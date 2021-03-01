//
//  CatalogFactoryTest.swift
//  TRShopTests
//
//  Created by Nail Safin on 18.02.2021.
//

import XCTest
@testable import TRShop
import Alamofire

class CatalogFactoryTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_CatalogRequest() throws {
        //Given
        let baseURL =  try XCTUnwrap(URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/"))
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let session = Session(configuration: configuration)
        
        let catalog = CatalogProducts(errorParser: ErrorParser(), sessionManager: session, queue: DispatchQueue.global(qos: .default), baseURL: baseURL)
        //When
        let getCatalog = expectation(description: "getting catalog is done")
        
        catalog.getAllCatalog(page: 1, id: 1) { (response) in
            //Then
            
            switch response.result {
            case .success(let reg):
                XCTAssertEqual(reg[0].idProduct, 123)
                XCTAssertEqual(reg[0].productName, "Ноутбук")
                XCTAssertEqual(reg[0].price, 45600)
                getCatalog.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 2)
    }
    
    
    //MARK: - Negative Test
    
    func test_WrongUrlCatalog() throws {
        //Given
 
        let baseURL =  try XCTUnwrap(URL(string: "https://wrongURL.com"))
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let session = Session(configuration: configuration)
        
        let catalog = CatalogProducts(errorParser: ErrorParser(), sessionManager: session, queue: DispatchQueue.global(qos: .default), baseURL: baseURL)
        let failedCatalog = expectation(description: "failed geting catalog")
        
        catalog.getAllCatalog(page: 1, id: 1) { (response) in
            //Then
            
            switch response.result {
            case .success(let reg):
                XCTFail("maust be failed : \(reg)")
            case .failure:
                failedCatalog.fulfill()
            }
        }
        waitForExpectations(timeout: 2)
    }
}
