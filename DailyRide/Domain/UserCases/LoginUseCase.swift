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

