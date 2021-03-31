//
//  DetailPriceCellViewModel.swift
//  MercadoLibreChallenge
//
//  Created by Mario Rúa on 30/03/21.
//

import Foundation

struct DetailPriceCellViewModel: CellViewModel {
    let price: String
    let installments: String?
    
    init(price: String, installments: String?) {
        self.price = price
        self.installments = installments
    }
}
