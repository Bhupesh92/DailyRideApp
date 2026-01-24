//
//  AuthTokenProvider.swift
//  DailyRide
//
//  Created by Kumari Bhavana on 24/01/26.
//

import Foundation

protocol AuthTokenProvider {
    func getToken() -> String?
    func saveToken(_ token: String)
    func clearToken()
}

final class DefaultAuthTokenProvider: AuthTokenProvider {

    private var token: String?

    func getToken() -> String? {
        token
    }

    func saveToken(_ token: String) {
        self.token = token
    }

    func clearToken() {
        token = nil
    }
}
