//
//  Coordinator.swift
//  MercadoLibreTest (iOS)
//
//  Created by Mario Rúa on 27/03/21.
//

import Foundation

protocol Coordinator: class {
    func start()
    func start(with option: DeepLinkOption?)
}
