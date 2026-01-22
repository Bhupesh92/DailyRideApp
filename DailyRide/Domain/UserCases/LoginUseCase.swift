//
//  LoginUseCase.swift
//  DailyRide
//
//  Created by Kumari Bhavana on 22/01/26.
//

import Foundation

// Domain Model
struct User {
    let id: String
    let name: String
    let email: String
}

// Use Case
protocol LoginUseCase {
    func execute(email: String, password: String) async throws -> User
}
