//
//  XCUIApplication+Launch.swift
//  DailyRideUITests
//
//  Created by Kumari Bhavana on 30/01/26.
//

import XCTest

extension XCUIApplication {

    func launchForUITest(
        isLoggedIn: Bool = false,
        mockLoginSuccess: Bool = true
    ) {
        launchArguments.append("--ui-testing")
        launchArguments.append("--mock-login=\(mockLoginSuccess)")
        launchArguments.append("--logged-in=\(isLoggedIn)")
        launch()
    }
}

