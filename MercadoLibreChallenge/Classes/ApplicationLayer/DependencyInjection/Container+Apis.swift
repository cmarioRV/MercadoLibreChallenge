//
//  Container+Apis.swift
//  GoCycling
//
//  Created by Mario Rúa on 13/09/20.
//  Copyright © 2020 Mario Rúa. All rights reserved.
//

import Foundation
import Swinject

extension Container {
    func registerApis() {
        if (ProcessInfo.processInfo.environment["DEV"] != nil) {
            register(BaseApi.self) {_ in DevApi()}
        }
        else {
            register(BaseApi.self) {_ in PdnApi()}
        }
    }
}
