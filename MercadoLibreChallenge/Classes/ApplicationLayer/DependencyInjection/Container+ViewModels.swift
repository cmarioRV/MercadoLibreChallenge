//
//  Container+ViewModels.swift
//  GoCycling
//
//  Created by Mario Rúa on 13/09/20.
//  Copyright © 2020 Mario Rúa. All rights reserved.
//

import Foundation
import Swinject

extension Container {
    func registerViewModels() {
        register(SearchViewModelType.self) {r in SearchViewModel(itemServices: r.resolve(ItemServices.self)!)}
    }
}
