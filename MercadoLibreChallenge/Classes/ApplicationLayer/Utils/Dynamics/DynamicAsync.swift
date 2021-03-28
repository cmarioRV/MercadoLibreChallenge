//
//  DynamicAsync.swift
//  MercadoLibreChallenge
//
//  Created by Mario Rúa on 27/03/21.
//

import Foundation

class DynamicAsync<T>: Dynamic<T> {
    
    // MARK: - Ovverides
    
    override func fire() {
        self.listener?(self.value)
    }
    
    // MARK: - Initialization
    
    override init(_ v: T) {
        super.init(v)
    }
}
