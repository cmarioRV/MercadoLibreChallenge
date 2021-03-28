//
//  UserServices.swift
//  MercadoLibreChallenge
//
//  Created by Mario Rúa on 27/03/21.
//

import Foundation

class UserServices {
    
    // MARK: - Vars & Lets
    
    private let apiManager: APIManager
    private let token: String = "tokenGoesHere"
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
}
