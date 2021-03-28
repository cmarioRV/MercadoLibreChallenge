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
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
    
    // MARK: - Public methods
    func search(params: [String: Any], handler: @escaping (_ searchResult: SearchResult?, _ message: AlertMessage?)->()) {
        self.apiManager.call(type: RequestItemsType.sites, params: params) { (_ searchResult: SearchResult?, _ message: AlertMessage?) in
            if let searchResult = searchResult {
                handler(searchResult, nil)
            } else {
                handler(nil, message!)
            }
        }
    }
    
    /*
    func getProfile(handler: @escaping (_ profile: UserProfile.User?, _ message: AlertMessage?)->()) {
        self.apiManager.call(type: RequestItemsType.getUser) { (profile: UserProfile.User?, message: AlertMessage?) in
            if let profile = profile {
                self.userServices.user = profile
                handler(profile, nil)
            } else {
                handler(nil, message!)
            }
        }
    }
    */
    // MARK: - Initialization
    
    init(apiManager: APIManager, userServices: UserServices) {
        self.apiManager = apiManager
        //self.userServices = userServices
    }
}
