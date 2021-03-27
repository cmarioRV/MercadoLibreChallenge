//
//  LaunchInstructor.swift
//  MercadoLibreTest (iOS)
//
//  Created by Mario Rúa on 27/03/21.
//

import Foundation

enum LaunchInstructor {
    
    case main
    case auth
    case onboarding
    
    // MARK: - Public methods
    
    static func configure(isAutorized: Bool = false, tutorialWasShown: Bool = false) -> LaunchInstructor {
        
        let isAutorized = isAutorized
        let tutorialWasShown = tutorialWasShown
        
        switch (tutorialWasShown, isAutorized) {
            case (true, false), (false, false): return .auth
            case (false, true): return .onboarding
            case (true, true): return .main
        }
    }
}
