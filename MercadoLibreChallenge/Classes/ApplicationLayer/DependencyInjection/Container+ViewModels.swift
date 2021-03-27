//
//  Container+ViewModels.swift
//  GoCycling
//
//  Created by Mario Rúa on 13/09/20.
//  Copyright © 2020 Mario Rúa. All rights reserved.
//

import Foundation
import Swinject

extension Container {
    func registerViewModels() {
        register(LoginViewModelType.self) {r in LoginViewModel(loginService: r.resolve(LoginService.self)!, databaseService: r.resolve(DatabaseService.self)!)}
    }
}
