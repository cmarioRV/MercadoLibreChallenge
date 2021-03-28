//
//  RequestItems.swift
//  MercadoLibreChallenge
//
//  Created by Mario Rúa on 27/03/21.
//

import Alamofire

// MARK: - Enums

enum NetworkEnvironment {
    case dev
    case production
    case stage
}

enum RequestItemsType {
    
    // MARK: Events
    
    case events(_: String)
    
    // MARK: User
    
    case sites
    case users
    
}

// MARK: - Extensions
// MARK: - EndPointType

extension RequestItemsType: EndPointType {
    
    // MARK: - Vars & Lets
    
    var baseURL: String {
        switch APIManager.networkEnviroment {
            case .dev: return "https://api.mercadolibre.com/"
            case .production: return "https://api.mercadolibre.com/"
            case .stage: return "https://api.mercadolibre.com/"
        }
    }
    
    var version: String {
        return "/v0_1"
    }
    
    var path: String {
        switch self {
        case .events(_):
            return "event"
        case .sites:
            return "sites"
        case .users:
            return "users"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        default:
            return ["Content-Type": "application/json",
                    "X-Requested-With": "XMLHttpRequest"]
        }
    }
    
    var url: URL {
        switch self {
        default:
            return URL(string: "\(self.baseURL)\(self.path)/\(self.siteId)/\(query)")!
        }
    }
    
    var siteId: String {
        switch self {
        default:
            return "MLA"
        }
    }
    
    var query: String {
        switch self {
        default:
            return "search"
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .sites:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
}
