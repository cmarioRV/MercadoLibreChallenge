//
//  ItemServices.swift
//  MercadoLibreChallenge
//
//  Created by Mario Rúa on 27/03/21.
//

import Foundation

class ItemServices {
    
    // MARK: - Vars & Lets
    
    private let apiManager: APIManager
    
    // MARK: - Initialization
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
    
    // MARK: - Public methods
    func search(params: [String: Any], handler: @escaping (_ searchResult: SearchResult?, _ message: (title: String, body: String)?)->()) {
        self.apiManager.call(type: RequestItemsType.sites, params: params) { (_ searchResult: SearchResult?, _ message: (title: String, body: String)?) in
            if let searchResult = searchResult {
                handler(searchResult, nil)
            } else {
                handler(nil, message!)
            }
        }
    }
}
