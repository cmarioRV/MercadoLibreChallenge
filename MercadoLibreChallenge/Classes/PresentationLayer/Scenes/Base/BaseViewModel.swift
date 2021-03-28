//
//  BaseViewModel.swift
//  MercadoLibreChallenge
//
//  Created by Mario Rúa on 28/03/21.
//

import Foundation

protocol BaseViewModelProtocol {
    var alertMessage: Dynamic<AlertMessage> { get set }
}

class BaseViewModel: NSObject, BaseViewModelProtocol {
    
    // MARK: - BaseViewModelProtocol
    
    var alertMessage: Dynamic<AlertMessage> = Dynamic(AlertMessage(title: "", body: ""))
}
