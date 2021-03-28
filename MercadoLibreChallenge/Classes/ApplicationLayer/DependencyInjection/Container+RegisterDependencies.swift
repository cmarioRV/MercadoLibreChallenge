//
//  Container+RegisterDependencies.swift
//  GoCycling
//
//  Created by Mario Rúa on 13/09/20.
//  Copyright © 2020 Mario Rúa. All rights reserved.
//

import Foundation
import Swinject
import UIKit

extension Container {
    func registerDependencies(rootViewController: UINavigationController) {
        registerNetworkingComponents()
        registerServices()
        registerViewModels()
        registerRouter(root: rootViewController)
        registerCoordinators()
        registerViewControllers()
    }
}
