//
//  MockLoginUseCase.swift
//  DailyRideTests
//
//  Created by Kumari Bhavana on 30/01/26.
//

import Foundation
@testable import DailyRide
// 👉 You can mock either repository or use case.
class MockLoginUseCase: LoginUseCase {
    
    var shouldThrowError = false
    var receivedEmail: String?
    var receivedPassword: String?
    
    func execute(email: String, password: String) async throws -> DailyRide.User {
        receivedEmail = email
        receivedPassword = password

        if shouldThrowError {
            throw APIError.unauthorized
        }

        return User(
            id: "123",
            name: "Test User",
            email: email
        )
    }
}

