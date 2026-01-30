//
//  MockLoginUseCase.swift
//  DailyRideUITests
//
//  Created by Kumari Bhavana on 30/01/26.
//

import Foundation
@testable import DailyRide

final class MockLoginUseCase: LoginUseCase {

    func execute(email: String, password: String) async throws -> User {
        if AppEnvironment.shared.isMockLoginSuccess {
            return User(id: "1", name: "UI Test", email: email)
        } else {
            throw APIError.unauthorized
        }
    }
}
