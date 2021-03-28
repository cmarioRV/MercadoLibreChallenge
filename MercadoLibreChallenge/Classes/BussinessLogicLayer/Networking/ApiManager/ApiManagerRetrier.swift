//
//  ApiManagerRetrier.swift
//  MercadoLibreChallenge
//
//  Created by Mario Rúa on 27/03/21.
//

import Foundation
import Alamofire

class APIManagerRetrier: RequestInterceptor {
    
    // MARK: - Vars & Lets
    
    var numberOfRetries = 0
    
    // MARK: - Request Retrier methods
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        if (error.localizedDescription == "The operation couldn’t be completed. Software caused connection abort") {
            completion(.retryWithDelay(1)) // retry after 1 second
            self.numberOfRetries += 1
        } else if let response = request.task?.response as? HTTPURLResponse, response.statusCode >= 500, self.numberOfRetries < 3 {
            completion(.retryWithDelay(1)) // retry after 1 second
            self.numberOfRetries += 1
        } else {
            completion(.doNotRetry) // don't retry
            self.numberOfRetries = 0
        }
    }
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
            var urlRequest = urlRequest
            urlRequest.setValue("Bearer " + "IHopeToPassChallengeToGetThisTokenByImplementingANicePattern", forHTTPHeaderField: "Authorization")
            completion(.success(urlRequest))
        }
}
