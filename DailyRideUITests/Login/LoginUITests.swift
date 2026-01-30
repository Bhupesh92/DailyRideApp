//
//  LoginUITests.swift
//  DailyRideUITests
//
//  Created by Kumari Bhavana on 30/01/26.
//

import Foundation
import XCTest

final class LoginUITests: XCTestCase {

    private var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
    }

    // MARK: - Success Flow

    func test_login_success_navigatesToDashboard() {
        // Given
        app.launchForUITest(mockLoginSuccess: true)

        let emailField = app.textFields["login_email_textfield"]
        let passwordField = app.secureTextFields["login_password_textfield"]
        let loginButton = app.buttons["login_button"]

        // When
        XCTAssertTrue(emailField.waitForExistence(timeout: 2))
        emailField.tap()
        emailField.typeText("test@mail.com")

        passwordField.tap()
        passwordField.typeText("password123")

        loginButton.tap()

        // Then
        let dashboardTitle = app.staticTexts["dashboard_title"]
        XCTAssertTrue(dashboardTitle.waitForExistence(timeout: 3))
    }

    // MARK: - Failure Flow

    func test_login_failure_showsErrorMessage() {
        // Given
        app.launchForUITest(mockLoginSuccess: false)

        let emailField = app.textFields["login_email_textfield"]
        let passwordField = app.secureTextFields["login_password_textfield"]
        let loginButton = app.buttons["login_button"]

        // When
        emailField.tap()
        emailField.typeText("wrong@mail.com")

        passwordField.tap()
        passwordField.typeText("wrong")

        loginButton.tap()

        // Then
        let errorText = app.staticTexts["login_error_text"]
        XCTAssertTrue(errorText.waitForExistence(timeout: 2))
        XCTAssertEqual(errorText.label, "Invalid credentials")
    }
}
