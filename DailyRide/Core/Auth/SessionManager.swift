//
//  SessionManager.swift
//  DailyRide
//
//  Created by Kumari Bhavana on 11/02/26.
//

import Foundation
final class SessionManager {

    private let storage: SecureStorage
    private let tokenKey = "auth_token"

    init(storage: SecureStorage) {
        self.storage = storage
    }

    func saveToken(_ token: AuthToken) throws {
        let data = try JSONEncoder().encode(token)
        try storage.save(data, for: tokenKey)
    }

    func getValidAccessToken() throws -> String? {
        guard let data = try storage.read(for: tokenKey) else { return nil }
        let token = try JSONDecoder().decode(AuthToken.self, from: data)

        if token.expiryDate > Date() {
            return token.accessToken
        }
        return nil
    }

    func getRefreshToken() throws -> String? {
        guard let data = try storage.read(for: tokenKey) else { return nil }
        let token = try JSONDecoder().decode(AuthToken.self, from: data)
        return token.refreshToken
    }

    func clearSession() throws {
        try storage.delete(for: tokenKey)
    }
}
