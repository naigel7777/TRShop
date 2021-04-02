//
//  BasketFactory.swift
//  TRShop
//
//  Created by Nail Safin on 02.03.2021.
//

import Foundation
import Alamofire
protocol BasketFactory {
    func addToBasket(productID: Int, quantity: Int, completionHandler: @escaping (AFDataResponse<AddToBasketResponseModel>) -> Void)
    func deleteFromBasket(productID: Int, completionHandler: @escaping (AFDataResponse<DeleteFromBasketResponseModel>) -> Void)
    func getBasket(userID: Int, completionHandler: @escaping (AFDataResponse<GetBasketResponseModel>) -> Void)
}
   
class BasketEditor: AbstractRequestFactory {
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

extension BasketEditor: BasketFactory {

    func addToBasket(productID: Int, quantity: Int, completionHandler: @escaping (AFDataResponse<AddToBasketResponseModel>) -> Void) {
        let requestModel = AddNewProduct(baseUrl: baseUrl, productId: productID, quantity: quantity)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func deleteFromBasket(productID: Int, completionHandler: @escaping (AFDataResponse<DeleteFromBasketResponseModel>) -> Void) {
        let requestModel = DeleteProduct(baseUrl: baseUrl, productId: productID)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func getBasket(userID: Int, completionHandler: @escaping (AFDataResponse<GetBasketResponseModel>) -> Void) {
        let requestModel = AllBasket(baseUrl: baseUrl, userId: userID)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    

}

extension BasketEditor {
    struct AddNewProduct: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path = "addToBasket.json"
        
        let productId: Int
        let quantity: Int
        
        var parameters: Parameters? {
            return [
                "id_product": productId,
                "quantity": quantity
            ]
        }
    }
    
    struct DeleteProduct: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path = "deleteFromBasket.json"
        
        let productId: Int

        
        var parameters: Parameters? {
            return [
                "id_product": productId
            ]
        }
    }
    
    struct AllBasket: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path = "getBasket.json"
        
        let userId: Int

        
        var parameters: Parameters? {
            return [
                "id_user": userId
            ]
        }
    }
}
