//
//  ApplicationCoordinator.swift
//  MercadoLibreTest (iOS)
//
//  Created by Mario Rúa on 27/03/21.
//

import Foundation

final class ApplicationCoordinator: BaseCoordinator {
    
    // MARK: - Vars & Lets
    
    private let factory: Factory
    private let router: RouterProtocol
    private var launchInstructor: LaunchInstructor
    
    // MARK: - Coordinator
    
    override func start(with option: DeepLinkOption?) {
        if option != nil {
            
        } else {
            switch launchInstructor {
            case .onboarding: runOnboardingFlow()
            case .auth: runAuthFlow()
            case .main: runMainFlow()
            }
        }
    }
    
    // MARK: - Private methods
    
    private func runAuthFlow() {
        let coordinator = self.factory.instantiateAuthCoordinator(router: self.router)
        coordinator.finishFlow = { [unowned self, unowned coordinator] in
            self.removeDependency(coordinator)
            self.launchInstructor = LaunchInstructor.configure(isAutorized: true, tutorialWasShown: false)
            self.start()
        }
        self.addDependency(coordinator)
        coordinator.start()
    }

    private func runOnboardingFlow() {
        let coordinator = self.factory.instantiateWalktroughCoordinator(router: self.router)
        coordinator.finishFlow = { [unowned self, unowned coordinator] in
            self.removeDependency(coordinator)
            self.launchInstructor = LaunchInstructor.configure(isAutorized: true, tutorialWasShown: true)
            self.start()
        }
        self.addDependency(coordinator)
        coordinator.start()
    }

    private func runMainFlow() {
        let coordinator = self.factory.instantiateSideMenuCoordinator(router: router)
        coordinator.finishFlow = { [unowned self, unowned coordinator] in
            self.removeDependency(coordinator)
            self.launchInstructor = LaunchInstructor.configure()
            self.start()
        }
        self.addDependency(coordinator)
        coordinator.start()
    }
    
    // MARK: - Init
    
    init(router: RouterProtocol, factory: Factory, launchInstructor: LaunchInstructor) {
        self.router = router
        self.factory = factory
        self.launchInstructor = launchInstructor
    }
    
}
