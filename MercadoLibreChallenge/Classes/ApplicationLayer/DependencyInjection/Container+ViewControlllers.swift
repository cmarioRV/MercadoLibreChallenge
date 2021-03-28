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
    }
}

extension Container: SearchViewControllerFactory {
    func instantiateSearchViewController() -> SearchViewController {
        return resolve(SearchViewController.self)!
    }
}
