//
//  SearchDetailViewModel.swift
//  MercadoLibreChallenge
//
//  Created by Mario Rúa on 28/03/21.
//

import Foundation
import Connectivity

internal protocol SearchDetailViewModelInputs {
    func loadResult(result: Results)
}

internal protocol SearchDetailViewModelOutputs {
    var isBussy: Dynamic<Bool> { get }
    var cellViewModels: Dynamic<[CellViewModel]> { get }
}

internal protocol SearchDetailViewModelType {
    var inputs: SearchDetailViewModelInputs { get }
    var outputs: SearchDetailViewModelOutputs { get }
}

internal final class SearchDetailViewModel: BaseViewModel, SearchDetailViewModelType, SearchDetailViewModelInputs, SearchDetailViewModelOutputs
{
    var inputs: SearchDetailViewModelInputs { return self }
    var outputs: SearchDetailViewModelOutputs { return self }
    
    var isBussy = Dynamic(false)
    var cellViewModels: Dynamic<[CellViewModel]>
    
    private let connectivity: Connectivity = Connectivity()
    
    override init() {
        self.cellViewModels = Dynamic([CellViewModel]())
        super.init()
        connectivity.startNotifier()
    }
    
    deinit {
        connectivity.stopNotifier()
    }
    
    internal func loadResult(result: Results) {
        if isBussy.value { return }
        isBussy.value = true
        
        let viewModels = buildCellViewModels(result: result)
        cellViewModels.value = viewModels
        
        isBussy.value = false
    }
    
    private func buildCellViewModels(result: Results) -> [CellViewModel] {
        var viewModels = [CellViewModel]()
        
        let imageCellViewModel = DetailImageCellViewModel(imageURLString: result.thumbnail ?? "")
        let priceCellViewModel = DetailPriceCellViewModel(price: getPriceText(result.price), installments: getInstallmentsText(result.installments))
        let sellerCellViewModel = DetailSellerCellViewModel(salesTitle: "sales".localized, salesValue: result.seller?.seller_reputation?.transactions?.completed ?? 0, ratingTitle: "rate".localized, ratingValue: getRating(calification: result.seller?.seller_reputation?.transactions?.ratings?.positive, starCount: 5))
        
        viewModels.append(imageCellViewModel)
        viewModels.append(priceCellViewModel)
        viewModels.append(sellerCellViewModel)
        
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
    
    private func getRating(calification: Double?, starCount: Int) -> Double {
        guard let calification = calification else { return 0 }
        return calification * Double(starCount)
    }
}
