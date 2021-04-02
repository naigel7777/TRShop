//
//  CommentFactory.swift
//  TRShop
//
//  Created by Nail Safin on 01.03.2021.
//

import Foundation
import Alamofire
protocol CommentsFactory {
    func addRewiew(idUser: Int, text: String, completionHandler: @escaping (AFDataResponse<CommentResponseModel>) -> Void)
    func approveReview(commentId: Int, completionHandler: @escaping (AFDataResponse<CommentApproveResponseModel>) -> Void)
    func removeReview(commentId: Int, completionHandler: @escaping (AFDataResponse<CommentDeleteResponseModel>) -> Void)
}
class CommentEditor: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl: URL
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility), baseURL: URL) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
        self.baseUrl = baseURL
    }
}

extension CommentEditor: CommentsFactory {

    func addRewiew(idUser: Int, text: String, completionHandler: @escaping (AFDataResponse<CommentResponseModel>) -> Void) {
        let requestModel = NewComment(baseUrl: baseUrl, idUser: idUser, text: text)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func approveReview(commentId: Int, completionHandler: @escaping (AFDataResponse<CommentApproveResponseModel>) -> Void) {
        let requestModel = ApproveComment(baseUrl: baseUrl, idComment: commentId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func removeReview(commentId: Int, completionHandler: @escaping (AFDataResponse<CommentDeleteResponseModel>) -> Void) {
        let requestModel = RemoveComment(baseUrl: baseUrl, idComment: commentId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    

}

extension CommentEditor {
    struct NewComment: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path = "addReview.json"
        
        let idUser: Int
        let text: String
        
        var parameters: Parameters? {
            return [
                "id_user": idUser,
                "text": text
            ]
        }
    }
    
    struct ApproveComment: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path = "approveReview.json"
        
        let idComment: Int

        
        var parameters: Parameters? {
            return [
                "id_comment": idComment
            ]
        }
    }
    
    struct RemoveComment: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path = "removeReview.json"
        
        let idComment: Int

        
        var parameters: Parameters? {
            return [
                "id_comment": idComment
            ]
        }
    }
}
