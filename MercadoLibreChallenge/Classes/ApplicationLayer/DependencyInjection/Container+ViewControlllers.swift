//
//  Container+ViewControlllers.swift
//  MercadoLibreChallenge
//
//  Created by Mario Rúa on 27/03/21.
//

import Foundation
import Swinject

extension Container {
    func registerViewControllers() {
        register(SearchViewController.self) {r in SearchViewController()}
            .initCompleted { (r, vc) in
                vc.viewModel = r.resolve(SearchViewModelType.self)
            }
        
        register(SearchDetailViewController.self) {r in SearchDetailViewController()}
            .initCompleted { (r, vc) in
                vc.viewModel = r.resolve(SearchDetailViewModelType.self)
            }
    }
}

extension Container: SearchViewControllerFactory {
    func instantiateSearchViewController() -> SearchViewController {
        return resolve(SearchViewController.self)!
    }
    
    func instantiateSearchDetailViewController() -> SearchDetailViewController {
        return resolve(SearchDetailViewController.self)!
    }
}
