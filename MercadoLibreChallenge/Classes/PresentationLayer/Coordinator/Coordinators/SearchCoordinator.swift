//
//  SearchCoordinator.swift
//  MercadoLibreChallenge
//
//  Created by Mario Rúa on 27/03/21.
//

import Foundation

final class SearchCoordinator: BaseCoordinator, CoordinatorFinishOutput {
    
    // MARK: - CoordinatorFinishOutput
    
    var finishFlow: (() -> Void)?
    
    // MARK: - Vars & Lets
    
    private let router: RouterProtocol
    private let factory: Factory
    
    // MARK: - Private metods
    
    private func showSearchViewController() {
        let searchViewController = self.factory.instantiateSearchViewController()
        searchViewController.onShowSearchDetail = { [unowned self] result in
            self.showSearchDetailViewController(result: result)
        }
//        self.router.push(searchViewController)
        self.router.setRootModule(searchViewController, hideBar: false)
    }
    
    private func showSearchDetailViewController(result: Results) {
        let searchDetailViewController = self.factory.instantiateSearchDetailViewController()
        searchDetailViewController.result = result
        self.router.push(searchDetailViewController)
    }
    
    // MARK: - Coordinator
    
    override func start() {
        self.showSearchViewController()
    }
    
    // MARK: - Init
    
    init(router: RouterProtocol, factory: Factory) {
        self.router = router
        self.factory = factory
    }
    
}
