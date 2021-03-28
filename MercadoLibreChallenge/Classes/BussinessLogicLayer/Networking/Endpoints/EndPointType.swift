//
//  EndPointType.swift
//  MercadoLibreChallenge
//
//  Created by Mario Rúa on 27/03/21.
//

import Alamofire

protocol EndPointType {
    
    // MARK: - Vars & Lets
    
    var baseURL: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var url: URL { get }
    var encoding: ParameterEncoding { get }
    var version: String { get }
    var siteId: String { get }
}
