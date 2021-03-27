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
        register(LoginService.self) {r in LoginService(repository: r.resolve(LoginRepository.self)!)}.inObjectScope(.container)
        register(UserInfoService.self) {r in UserInfoService(repository: r.resolve(UserInfoRepository.self)!)}
    }
}
