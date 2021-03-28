//
//  Value_struct.swift
//  MercadoLibreChallenge
//
//  Created by Mario Rúa on 28/03/21.
//

import Foundation
struct Value_struct : Codable {
    let number : Double?
    let unit : String?

    enum CodingKeys: String, CodingKey {

        case number = "number"
        case unit = "unit"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        number = try values.decodeIfPresent(Double.self, forKey: .number)
        unit = try values.decodeIfPresent(String.self, forKey: .unit)
    }
}
