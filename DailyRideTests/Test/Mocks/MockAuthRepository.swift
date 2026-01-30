//
//  MockAuthRepository.swift
//  DailyRideTests
//
//  Created by Kumari Bhavana on 30/01/26.
//

@testable import DailyRide
import Foundation

final class MockAuthRepository: AuthRepository {

    var shouldThrowError = false
    var receivedEmail: String?
    var receivedPassword: String?

    func login(email: String, password: String) async throws -> User {
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

    func signUp(name: String, email: String, password: String) async throws -> User {
        fatalError("Not needed for login tests")
    }
    
    func logout() {
        
    }
    
    func isUserLoggedIn() -> Bool {
        return true
    }
}
