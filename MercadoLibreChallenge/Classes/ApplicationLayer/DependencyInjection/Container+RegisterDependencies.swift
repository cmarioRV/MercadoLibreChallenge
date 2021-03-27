//
//  Container+RegisterDependencies.swift
//  GoCycling
//
//  Created by Mario Rúa on 13/09/20.
//  Copyright © 2020 Mario Rúa. All rights reserved.
//

import Foundation
import Swinject

extension Container {
    func registerDependencies() {
        registerRepositories()
        registerApis()
        registerServices()
        registerViewModels()
    }
}
