//
//  Container+Router.swift
//  MercadoLibreChallenge
//
//  Created by Mario Rúa on 27/03/21.
//

import Foundation
import Swinject

extension Container {
    func registerRouter(root: UINavigationController) {
        register(RouterProtocol.self) {_ in Router(rootController: root)}
    }
}
