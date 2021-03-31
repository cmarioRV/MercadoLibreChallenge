//
//  DetailImageCellViewModel.swift
//  MercadoLibreChallenge
//
//  Created by Mario Rúa on 29/03/21.
//

import Foundation

struct DetailImageCellViewModel: CellViewModel {
    let imageURLString: String
    
    init(imageURLString: String) {
        self.imageURLString = imageURLString
    }
}
