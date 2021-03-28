//
//  SearchViewModel.swift
//  MercadoLibreChallenge
//
//  Created by Mario Rúa on 27/03/21.
//

import Foundation

internal protocol SearchViewModelInputs {
}

internal protocol SearchViewModelOutputs {
}

internal protocol SearchViewModelType {
    var inputs: SearchViewModelInputs { get }
    var outputs: SearchViewModelOutputs { get }
}

internal final class SearchViewModel: SearchViewModelType, SearchViewModelInputs, SearchViewModelOutputs
{
    var inputs: SearchViewModelInputs { return self }
    var outputs: SearchViewModelOutputs { return self }
}