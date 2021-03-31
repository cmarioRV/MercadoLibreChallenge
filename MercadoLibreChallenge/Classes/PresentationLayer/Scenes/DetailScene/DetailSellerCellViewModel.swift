//
//  DetailFeaturesCellViewModel.swift
//  MercadoLibreChallenge
//
//  Created by Mario Rúa on 30/03/21.
//

import Foundation

struct DetailSellerCellViewModel: CellViewModel {
    let salesTitle: String
    let salesValue: Int
    let ratingTitle: String
    let ratingValue: Double
    
    init(salesTitle: String, salesValue: Int, ratingTitle: String, ratingValue: Double) {
        self.salesTitle = salesTitle
        self.salesValue = salesValue
        self.ratingTitle = ratingTitle
        self.ratingValue = ratingValue
    }
}
