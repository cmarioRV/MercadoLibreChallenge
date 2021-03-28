//
//  UITableViewCellExtensions.swift
//  MercadoLibreChallenge
//
//  Created by Mario Rúa on 28/03/21.
//

import Foundation
import UIKit

public extension UITableViewCell
{
    static func cellIdentifier() -> String {
        return String(describing: self)
    }
}
