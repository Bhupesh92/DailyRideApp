//
//  AppEnvironment.swift
//  DailyRideUITests
//
//  Created by Kumari Bhavana on 30/01/26.
//

import Foundation

final class AppEnvironment {
    static let shared = AppEnvironment()

    var isMockLoginSuccess: Bool = true

    func configureForUITests() {
        if let arg = CommandLine.arguments.first(where: { $0.contains("--mock-login") }) {
            isMockLoginSuccess = arg.contains("true")
        }
    }
}
