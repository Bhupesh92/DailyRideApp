//
//  SignUpUseCase.swift
//  DailyRide
//
//  Created by Kumari Bhavana on 24/01/26.
//

import Foundation

protocol SignUpUseCase {
    func execute(name: String, email: String, password: String) async throws -> User
}


final class SignUpUseCaseImpl: SignUpUseCase {

    private let repository: AuthRepository

    init(repository: AuthRepository) {
        self.repository = repository
    }

    func execute(
        name: String,
        email: String,
        password: String
    ) async throws -> User {

        // MARK: - Domain Validation
        guard !name.isEmpty else {
            throw ValidationError.emptyName
        }

        guard email.contains("@") else {
            throw ValidationError.invalidEmail
        }

        guard password.count >= 6 else {
            throw ValidationError.weakPassword
        }

        // MARK: - Repository Call
        return try await repository.signUp(
            name: name,
            email: email,
            password: password
        )
    }
}
