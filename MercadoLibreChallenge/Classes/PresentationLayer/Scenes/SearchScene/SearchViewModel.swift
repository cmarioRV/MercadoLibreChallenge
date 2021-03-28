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
    var cellViewModels: Dynamic<[SearchViewCellViewModel]> { get }
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
    var cellViewModels: Dynamic<[SearchViewCellViewModel]>
    
    private let connectivity: Connectivity = Connectivity()
    private let itemServices: ItemServices!
    
    init(itemServices: ItemServices) {
        self.itemServices = itemServices
        self.cellViewModels = Dynamic([SearchViewCellViewModel]())
        connectivity.startNotifier()
    }
    
    deinit {
        connectivity.stopNotifier()
    }
    
    func search(text: String) {
        if isBussy.value { return }
        isBussy.value = true
        
        itemServices.search(params: ["q" : text]) { [weak self] (searchResult, alertMessage) in
            guard let weakSelf = self else { return }
            if let searchResult = searchResult {
                weakSelf.cellViewModels.value = weakSelf.buildCellViewModels(searchResult: searchResult)
            } else {
                weakSelf.alertMessage.value = alertMessage!
            }
            
            weakSelf.isBussy.value = false
        }
    }
    
    private func buildCellViewModels(searchResult: SearchResult) -> [SearchViewCellViewModel] {
        guard let results = searchResult.results else { return [SearchViewCellViewModel]() }
        var viewModels = [SearchViewCellViewModel]()
        
        for result in results {
            let cellViewModel = SearchViewCellViewModel(title: result.title ?? "", price: getPriceText(result.price), installment: getInstallmentsText(result.installments), deliveryPrice: getShippingText(result.shipping), favImageName: "heartEmpty", itemImageName: "tempImage", thumbnail: result.thumbnail ?? "")

            viewModels.append(cellViewModel)
        }
        
        return viewModels
    }
    
    private func getPriceText(_ price: Double?) -> String {
        guard let price = price else { return "" }
        return "$ \(String(format: "%2f", price))"
    }
    
    private func getInstallmentsText(_ installments: Installments?) -> String? {
        guard let installments = installments, let quantity = installments.quantity, let amount = installments.amount else { return nil }
        return "[Dummy] \(String(quantity))x $ \(String(format: "%.3f", amount))"
    }
    
    private func getShippingText(_ shipping: Shipping?) -> String? {
        guard let shipping = shipping, let freeShipping = shipping.free_shipping else { return nil }
        return freeShipping ? "\("shipping".localized) \("free".localized.lowercased())" : ""
    }
}
