//
//  SearchViewModel.swift
//  MercadoLibreChallenge
//
//  Created by Mario Rúa on 27/03/21.
//

import Foundation
import Connectivity

internal protocol SearchViewModelInputs {
    func search(text: String)
}

internal protocol SearchViewModelOutputs {
    var isBussy: Dynamic<Bool> { get }
    var results: Dynamic<SearchResult?> { get }
}

internal protocol SearchViewModelType {
    var inputs: SearchViewModelInputs { get }
    var outputs: SearchViewModelOutputs { get }
}

internal final class SearchViewModel: BaseViewModel, SearchViewModelType, SearchViewModelInputs, SearchViewModelOutputs
{
    var inputs: SearchViewModelInputs { return self }
    var outputs: SearchViewModelOutputs { return self }
    
    var isBussy = Dynamic(false)
    var results: Dynamic<SearchResult?> = Dynamic(nil)
    
    private let connectivity: Connectivity = Connectivity()
    private let itemServices: ItemServices!
    
    init(itemServices: ItemServices) {
        self.itemServices = itemServices
        connectivity.startNotifier()
    }
    
    deinit {
        connectivity.stopNotifier()
    }
    
    func search(text: String) {
        if isBussy.value { return }
        isBussy.value = true
        
        itemServices.search(params: ["q" : text]) { [weak self] (searchResult, alertMessage) in
            self?.isBussy.value = false
            if let searchResult = searchResult {
                self?.results.value = searchResult
            } else {
                self?.alertMessage.value = alertMessage!
            }
        }
    }
}
