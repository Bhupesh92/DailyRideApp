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

    private let sessionManager: SessionManager

    init(sessionManager: SessionManager) {
        self.sessionManager = sessionManager
    }

    func intercept(_ request: URLRequest) -> URLRequest {
        var request = request
        
        if let token = try? sessionManager.getValidAccessToken() {
            request.addValue(
                "Bearer \(token)",
                forHTTPHeaderField: "Authorization"
            )
        }
        return request
    }
}
