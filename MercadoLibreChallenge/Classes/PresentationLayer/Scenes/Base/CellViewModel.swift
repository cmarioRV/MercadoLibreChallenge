//
//  CellViewModel.swift
//  MercadoLibreChallenge
//
//  Created by Mario Rúa on 28/03/21.
//

import Foundation

protocol CellViewModel {}

protocol ViewModelPressible {
    var cellPressed: (()->Void)? { get set }
}
