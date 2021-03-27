//
//  CoordinatorOutput.swift
//  MercadoLibreTest (iOS)
//
//  Created by Mario Rúa on 27/03/21.
//

import Foundation

protocol CoordinatorFinishOutput {
    var finishFlow: (() -> Void)? { get set }
}
