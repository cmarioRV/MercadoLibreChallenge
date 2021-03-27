//
//  Container+Repositories.swift
//  GoCycling
//
//  Created by Mario Rúa on 13/09/20.
//  Copyright © 2020 Mario Rúa. All rights reserved.
//

import Foundation
import Swinject

extension Container {
    func registerRepositories() {
        if (ProcessInfo.processInfo.environment["MOCKS"] != nil) {
            register(LoginRepository.self) {_ in MockLoginRepository()}
        }
        else {
            register(LoginRepository.self) {_ in RemoteLoginRepository()}
        }
    }
}
