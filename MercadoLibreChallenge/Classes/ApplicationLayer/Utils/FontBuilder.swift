//
//  FontBuilder.swift
//  MercadoLibreChallenge
//
//  Created by Mario Rúa on 28/03/21.
//

import Foundation
import UIKit

public enum FontType: String {
    case titleBold = "NexaBold"
    case titleLight = "NexaLight"
    case poppinsSemiBold = "Poppins-SemiBold"
    case poppinsRegular = "Poppins-Regular"
    case poppinsMedium = "Poppins-Medium"
    case bebasBold = "BebasNeue-Bold"
    case bebasRegular = "BebasNeue-Regular"
}

class FontBuilder {
    private var fontType: FontType! = .poppinsRegular
    private var fontSize: CGFloat! = 12
    
    func withFontType(type: FontType) -> FontBuilder {
        self.fontType = type
        return self
    }
    
    func withSize(size: CGFloat) -> FontBuilder {
        self.fontSize = size
        return self
    }
    
    func build() -> UIFont {
        return UIFont.init(name: fontType.rawValue, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
}
