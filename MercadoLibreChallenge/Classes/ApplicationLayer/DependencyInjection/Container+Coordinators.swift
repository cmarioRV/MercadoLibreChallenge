//
//  Container+Coordinators.swift
//  MercadoLibreChallenge
//
//  Created by Mario Rúa on 27/03/21.
//

import Foundation
import Swinject

extension Container {    
    func registerCoordinators() {
        register(ApplicationCoordinator.self) {r in ApplicationCoordinator(router: r.resolve(RouterProtocol.self)!, factory: self, launchInstructor: LaunchInstructor.configure())}
        register(SearchCoordinator.self) {r in SearchCoordinator(router: r.resolve(RouterProtocol.self)!, factory: self)}
    }
    
    func start() {
        resolve(ApplicationCoordinator.self)!.start()
    }
}

extension Container: CoordinatorFactoryProtocol {
    func instantiateSearchCoordinator() -> SearchCoordinator {
        return resolve(SearchCoordinator.self)!
    }
    
    func instantiateApplicationCoordinator() -> ApplicationCoordinator {
        return resolve(ApplicationCoordinator.self)!
    }
}
