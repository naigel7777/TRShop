//
//  CatalogProductsFactory.swift
//  TRShop
//
//  Created by Nail Safin on 18.02.2021.
//

import Foundation
import Alamofire
protocol CatalogProductsFactory {
    func getAllCatalog(page: Int, id: Int, completionHandler: @escaping (AFDataResponse<[CatalogModelElement]>) -> Void)
    func getProduct(productId: Int, completionHandler: @escaping (AFDataResponse<ProductModel>) -> Void)
}
class CatalogProducts: AbstractRequestFactory {
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

extension CatalogProducts: CatalogProductsFactory {

    
   func getAllCatalog(page: Int, id: Int, completionHandler: @escaping (AFDataResponse<[CatalogModelElement]>) -> Void) {
        let requestModel = Catalog(baseUrl: baseUrl, pageNumber: page, idCategory: id)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    func getProduct(productId: Int, completionHandler: @escaping (AFDataResponse<ProductModel>) -> Void) {
        let requestModel = Product(baseUrl: baseUrl, idProduct: productId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension CatalogProducts {
    struct Catalog: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path = "catalogData.json"
        
        let pageNumber: Int
        let idCategory: Int
        
        var parameters: Parameters? {
            return [
                "page_number": pageNumber,
                "id_category": idCategory

            ]
        }
    }
    struct Product: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path = "getGoodById.json"
        
        let idProduct: Int

        
        var parameters: Parameters? {
            return [
                "id_product": idProduct
            ]
        }
    }
    
}
