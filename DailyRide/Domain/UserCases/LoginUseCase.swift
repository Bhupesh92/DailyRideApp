//
//  LoginUseCase.swift
//  DailyRide
//
//  Created by Kumari Bhavana on 22/01/26.
//

import Foundation

// Use Case
protocol LoginUseCase {
    func execute(email: String, password: String) async throws -> User
}

final class LoginUseCaseImpl: LoginUseCase {
    private let repository: AuthRepository
    
    init(repository: AuthRepository) {
        self.repository = repository
    }
    
    func execute(email: String, password: String) async throws -> User {
        // MARK: - Domain Validation

        guard email.contains("@") else {
            throw ValidationError.invalidEmail
        }

        guard password.count >= 6 else {
            throw ValidationError.weakPassword
        }

        // MARK: - Repository Call
        return try await repository.login(email: email, password: password)
    }
}
    


