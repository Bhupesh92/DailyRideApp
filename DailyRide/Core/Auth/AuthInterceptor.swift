//
//  AuthInterceptor.swift
//  DailyRide
//
//  Created by Kumari Bhavana on 24/01/26.
//

import Foundation

protocol AuthInterceptor {
    func intercept(_ request: URLRequest) -> URLRequest
}

final class DefaultAuthInterceptor: AuthInterceptor {

    private let tokenProvider: AuthTokenProvider

    init(tokenProvider: AuthTokenProvider) {
        self.tokenProvider = tokenProvider
    }

    func intercept(_ request: URLRequest) -> URLRequest {
        var request = request
        
        if let token = tokenProvider.getToken() {
            request.addValue(
                "Bearer \(token)",
                forHTTPHeaderField: "Authorization"
            )
        }
        return request
    }
}
