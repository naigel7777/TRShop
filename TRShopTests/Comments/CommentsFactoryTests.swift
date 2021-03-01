//
//  CommentsFactoryTests.swift
//  TRShopTests
//
//  Created by Nail Safin on 01.03.2021.
//

import XCTest
@testable import TRShop
import Alamofire

class CommentsFactoryTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    //MARK: - Positive Test -- New Comment
    func test_CommentNew() throws {
//Given
        let baseURL =  try XCTUnwrap(URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/"))
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let session = Session(configuration: configuration)
        
        let commentManager = CommentEditor(errorParser: ErrorParser(), sessionManager: session, queue: DispatchQueue.global(qos: .default), baseURL: baseURL)
//When
        let newComment = expectation(description: "add new review is completed")
        
        commentManager.addRewiew(idUser: 111, text: "Test Comment") { (response) in
//Then
            
            switch response.result {
            case .success(let reg):
                XCTAssertEqual(reg.result, 1)
                XCTAssertEqual(reg.userMessage, "Ваш отзыв был передан на модерацию")
                newComment.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 2)
    }
    //MARK: - Positive Test -- Approve Comment
    func test_CommentApprove() throws {
//Given
        let baseURL =  try XCTUnwrap(URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/"))
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let session = Session(configuration: configuration)
        
        let commentManager = CommentEditor(errorParser: ErrorParser(), sessionManager: session, queue: DispatchQueue.global(qos: .default), baseURL: baseURL)
//When
        let newComment = expectation(description: "approving new review is completed")
        
        commentManager.approveReview(commentId: 123) { (response) in
//Then
            
            switch response.result {
            case .success(let reg):
                XCTAssertEqual(reg.result, 1)
                newComment.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 2)
    }
    //MARK: - Positive Test -- Remove Comment
    func test_CommentRemove() throws {
//Given
        let baseURL =  try XCTUnwrap(URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/"))
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let session = Session(configuration: configuration)
        
        let commentManager = CommentEditor(errorParser: ErrorParser(), sessionManager: session, queue: DispatchQueue.global(qos: .default), baseURL: baseURL)
//When
        let newComment = expectation(description: "removing  review is completed")
        
        commentManager.removeReview(commentId: 123) { (response) in
//Then
            
            switch response.result {
            case .success(let reg):
                XCTAssertEqual(reg.result, 1)
                newComment.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 2)
    }
    //MARK: - Negative Test
    
    func test_WrongUrlComment() throws {
        //Given
 
        let baseURL =  try XCTUnwrap(URL(string: "https://wrongURL.com"))
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let session = Session(configuration: configuration)
        
        let commentManager = CommentEditor(errorParser: ErrorParser(), sessionManager: session, queue: DispatchQueue.global(qos: .default), baseURL: baseURL)
        let failedComment = expectation(description: "failed adding new review")
        
        commentManager.addRewiew(idUser: 111, text: "Test Comment") { (response) in
            //Then
            
            switch response.result {
            case .success(let reg):
                XCTFail("maust be failed : \(reg)")
            case .failure:
                failedComment.fulfill()
            }
        }
        waitForExpectations(timeout: 2)
    }
}
