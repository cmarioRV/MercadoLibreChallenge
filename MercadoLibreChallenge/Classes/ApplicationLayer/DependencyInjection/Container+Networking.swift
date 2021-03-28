//
//  Container+Networking.swift
//  MercadoLibreChallenge
//
//  Created by Mario Rúa on 27/03/21.
//

import Foundation
import Swinject
import Alamofire

extension Container {
    func registerNetworkingComponents() {
        register(APIManagerRetrier.self) {_ in APIManagerRetrier()}
        register(Session.self) {r in Session(interceptor: r.resolve(APIManagerRetrier.self)!)}
        register(APIManager.self) {r in APIManager(sessionManager: r.resolve(Session.self)!, retrier: r.resolve(APIManagerRetrier.self)!)}
    }
}
