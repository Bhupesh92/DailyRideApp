//
//  AuthRepository.swift
//  DailyRide
//
//  Created by Kumari Bhavana on 22/01/26.
//

import Foundation

protocol AuthRepository {
    func login(
        email: String,
        password: String
    ) async throws -> User

    func signUp(
        name: String,
        email: String,
        password: String
    ) async throws -> User

    func logout()
    func isUserLoggedIn() -> Bool
}
