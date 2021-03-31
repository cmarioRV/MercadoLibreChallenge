//
//  BaseViewModel.swift
//  MercadoLibreChallenge
//
//  Created by Mario Rúa on 28/03/21.
//

import Foundation

protocol BaseViewModelProtocol {
    func handleError(error: Error?) -> (title: String, message: String)
}

class BaseViewModel: NSObject, BaseViewModelProtocol {
    
    // MARK: - BaseViewModelProtocol
    
    func handleError(error: Error?) -> (title: String, message: String)
    {
        if error == nil {
            return ("error_title".localized, "error_unknown".localized)
        }
    
        switch error {
        case is NetworkingErrors:
            return self.handleNetworkingError(error: error as! NetworkingErrors)
        case is SearchErrors:
            return self.handleNetworkingError(error: error as! SearchErrors)
        default:
            return ("error_title".localized, "error_unknown".localized)
        }
    }
    
    private func handleNetworkingError(error: NetworkingErrors) -> (String, String) {
        switch error {
        case .connectionError:
            return ("error_title".localized, "error_connection".localized)
        }
    }
    
    private func handleNetworkingError(error: SearchErrors) -> (String, String) {
        switch error {
        case .noResultsError:
            return ("error_title".localized, "error_no_results".localized)
        }
    }
}
