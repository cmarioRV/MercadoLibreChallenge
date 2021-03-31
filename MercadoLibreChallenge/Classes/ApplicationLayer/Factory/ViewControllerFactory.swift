//
//  ViewControllerFactory.swift
//  MercadoLibreChallenge
//
//  Created by Mario Rúa on 27/03/21.
//

import Foundation

protocol SearchViewControllerFactory {
    func instantiateSearchViewController() -> SearchViewController
    func instantiateSearchDetailViewController() -> SearchDetailViewController
}
