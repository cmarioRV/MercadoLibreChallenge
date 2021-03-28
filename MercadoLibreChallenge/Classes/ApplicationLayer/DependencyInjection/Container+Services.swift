//
//  Container+Services.swift
//  GoCycling
//
//  Created by Mario Rúa on 13/09/20.
//  Copyright © 2020 Mario Rúa. All rights reserved.
//

import Foundation
import Swinject

extension Container {
    func registerServices() {
        register(UserServices.self) {r in UserServices(apiManager: r.resolve(APIManager.self)!)}
    }
}
