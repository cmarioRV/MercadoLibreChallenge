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
    var searchResults: Dynamic<[Results]> { get }
    var error: Dynamic<(title: String, message: String)> { get }
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
    var searchResults: Dynamic<[Results]>
    var error: Dynamic<(title: String, message: String)>
    
    private let connectivity: Connectivity = Connectivity()
    private let itemServices: ItemServices!
    
    init(itemServices: ItemServices) {
        self.itemServices = itemServices
        self.cellViewModels = Dynamic([SearchViewCellViewModel]())
        self.searchResults = Dynamic([Results]())
        self.error = Dynamic(("", ""))
        connectivity.startNotifier()
    }
    
    deinit {
        connectivity.stopNotifier()
    }
    
    func search(text: String) {
        if text.count <= 2 { return }
        
        if isBussy.value { return }
        isBussy.value = true
        
        connectivity.checkConnectivity { [weak self] (connectivity) in
            guard let weakSelf = self else {
                self?.isBussy.value = false
                return }
            
            switch connectivity.status {
            case .notConnected, .connectedViaWiFiWithoutInternet, .connectedViaCellularWithoutInternet:
                weakSelf.error.value = weakSelf.handleError(error: NetworkingErrors.connectionError)
                weakSelf.isBussy.value = false
                return
            default:
                weakSelf.proceedToSearch(text: text)
            }
        }
    }
    
    private func proceedToSearch(text: String) {
        itemServices.search(params: ["q" : text]) { [weak self] (searchResult, message) in
            guard let weakSelf = self else { return }
            if let searchResult = searchResult {
                if let result = searchResult.results {
                    weakSelf.searchResults.value = result
                }
                weakSelf.cellViewModels.value = weakSelf.buildCellViewModels(searchResult: searchResult)
            } else {
                if let message = message {
                    weakSelf.error.value = (message.title, message.body)
                }
            }
            
            weakSelf.isBussy.value = false
        }
    }
    
    private func buildCellViewModels(searchResult: SearchResult) -> [SearchViewCellViewModel] {
        guard let results = searchResult.results else { return [SearchViewCellViewModel]() }
        var viewModels = [SearchViewCellViewModel]()
        
        for result in results {
            let cellViewModel = SearchViewCellViewModel(title: result.title ?? "", price: getPriceText(result.price), installment: getInstallmentsText(result.installments), deliveryPrice: getShippingText(result.shipping), favImageName: "heartEmpty", thumbnail: result.thumbnail ?? "")

            viewModels.append(cellViewModel)
        }
        
        return viewModels
    }
    
    private func getPriceText(_ price: Double?) -> String {
        guard let price = price else { return "" }
        return "$ \(String(format: "%.0f", price))"
    }
    
    private func getInstallmentsText(_ installments: Installments?) -> String? {
        guard let installments = installments, let quantity = installments.quantity, let amount = installments.amount else { return nil }
        return "[Dummy] \(String(quantity))x $ \(String(format: "%.2f", amount))"
    }
    
    private func getShippingText(_ shipping: Shipping?) -> String? {
        guard let shipping = shipping, let freeShipping = shipping.free_shipping else { return nil }
        return freeShipping ? "\("shipping".localized) \("free".localized.lowercased())" : ""
    }
}
