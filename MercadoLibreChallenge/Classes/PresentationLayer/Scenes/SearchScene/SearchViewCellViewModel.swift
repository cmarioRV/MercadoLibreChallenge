//
//  SearchViewCellViewModel.swift
//  MercadoLibreChallenge
//
//  Created by Mario Rúa on 28/03/21.
//

import Foundation

struct SearchViewCellViewModel: CellViewModel {
    let title: String
    let price: String
    let installment: String?
    let deliveryPrice: String?
    let favImageName: String
    let itemImageName: String
    let thumbnail: String
    
    var cellPressed: (()->Void)?
    
    init(title: String, price: String, installment: String?, deliveryPrice: String?, favImageName: String, itemImageName: String, thumbnail: String) {
        self.title = title
        self.price = price
        self.installment = installment
        self.deliveryPrice = deliveryPrice
        self.favImageName = favImageName
        self.itemImageName = itemImageName
        self.thumbnail = thumbnail
    }
}
