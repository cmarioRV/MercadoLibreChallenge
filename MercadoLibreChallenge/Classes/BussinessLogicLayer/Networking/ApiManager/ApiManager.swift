//
//  ApiManager.swift
//  MercadoLibreChallenge
//
//  Created by Mario Rúa on 27/03/21.
//

import Alamofire

class APIManager {
    
    // MARK: - Vars & Lets
    
    private let sessionManager: Session
    private let retrier: APIManagerRetrier
    static var networkEnviroment: NetworkEnvironment = .dev
    
    // MARK: - Public methods
    
    func call(type: EndPointType, params: Parameters? = nil, handler: @escaping (()?, _ error: AlertMessage?)->()) {
        self.sessionManager.request(type.url,
                                    method: type.httpMethod,
                                    parameters: params,
                                    encoding: type.encoding,
                                    headers: type.headers).validate().responseJSON { data in
                                        switch data.result {
                                        case .success(_):
                                            handler((), nil)
                                            self.resetNumberOfRetries()
                                            break
                                        case .failure(_):
                                            handler(nil, self.parseApiError(data: data.data))
                                            break
                                        }
        }
    }
    
    func call<T>(type: EndPointType, params: Parameters? = nil, handler: @escaping (T?, _ error: AlertMessage?)->()) where T: Codable {
        self.sessionManager.request(type.url,
                                    method: type.httpMethod,
                                    parameters: params,
                                    encoding: type.encoding,
                                    headers: type.headers).validate().responseJSON { data in
                                        switch data.result {
                                        case .success(_):
                                            let decoder = JSONDecoder()
                                            if let jsonData = data.data {
                                                let result = try! decoder.decode(T.self, from: jsonData)
                                                handler(result, nil)
                                                self.resetNumberOfRetries()
                                            }
                                            break
                                        case .failure(_):
                                            handler(nil, self.parseApiError(data: data.data))
                                            break
                                        }
        }
    }
    
    // MARK: - Private methods
    
    private func resetNumberOfRetries() {
        self.retrier.numberOfRetries = 0
    }
    
    private func parseApiError(data: Data?) -> AlertMessage {
        let decoder = JSONDecoder()
        if let jsonData = data, let error = try? decoder.decode(NetworkError.self, from: jsonData) {
            return AlertMessage(title: "error_alert_title".localized, body: error.key ?? error.message)
        }
        return AlertMessage(title: "error_alert_title".localized, body: "generic_error_message".localized)
    }
    
    // MARK: - Initialization
    
    init(sessionManager: Session, retrier: APIManagerRetrier) {
        self.sessionManager = sessionManager
        self.retrier = retrier
//        self.sessionManager.interceptor = self.retrier
        
        if (ProcessInfo.processInfo.environment["MOCKS"] != nil || ProcessInfo.processInfo.environment["DEV"] != nil) {
            APIManager.networkEnviroment = NetworkEnvironment.dev
        } else if (ProcessInfo.processInfo.environment["STG"] != nil) {
            APIManager.networkEnviroment = NetworkEnvironment.stage
        } else if (ProcessInfo.processInfo.environment["PDN"] != nil) {
            APIManager.networkEnviroment = NetworkEnvironment.production
        }
    }
}
