//
//  LoginViewModelTests.swift
//  DailyRideTests
//
//  Created by Kumari Bhavana on 30/01/26.
//

@testable import DailyRide
import XCTest

@MainActor
final class LoginViewModelTests: XCTestCase {

    private var viewModel: LoginViewModel!
    private var mockUseCase: MockLoginUseCase!

    override func setUp() {
        super.setUp()
        mockUseCase = MockLoginUseCase()
        viewModel = LoginViewModel(loginUseCase: mockUseCase)
    }

    override func tearDown() {
        viewModel = nil
        mockUseCase = nil
        super.tearDown()
    }

    // MARK: - Success Case

    func test_login_success_setsSuccessFlag() async {
        // Given Arrange
        viewModel.email = "test@mail.com"
        viewModel.password = "password123"

        // When Act
        await viewModel.login()

        // Then asset
        XCTAssertTrue(viewModel.isLoginSuccessful)
        XCTAssertNil(viewModel.error)
        XCTAssertFalse(viewModel.isLoading)
    }

    // MARK: - Failure Case

    func test_login_failure_setsErrorMessage() async {
        // Given
        mockUseCase.shouldThrowError = true
        viewModel.email = "wrong@mail.com"
        viewModel.password = "wrong"

        // When
        await viewModel.login()

        // Then
        XCTAssertFalse(viewModel.isLoginSuccessful)
        XCTAssertNotNil(viewModel.error)
        XCTAssertFalse(viewModel.isLoading)
    }

    // MARK: - Loading State

    func test_login_setsLoadingStateCorrectly() async {
        // Given
        viewModel.email = "test@mail.com"
        viewModel.password = "password123"

        // When
        let task = Task {
            await viewModel.login()
        }

        // Then (immediately after calling)
        XCTAssertTrue(viewModel.isLoading)

        await task.value
        XCTAssertFalse(viewModel.isLoading)
    }

    // MARK: - Input Validation

    func test_login_passesCorrectCredentialsToUseCase() async {
        // Given
        let email = "test@mail.com"
        let password = "password123"
        viewModel.email = email
        viewModel.password = password

        // When
        await viewModel.login()

        // Then
        XCTAssertEqual(mockUseCase.receivedEmail, email)
        XCTAssertEqual(mockUseCase.receivedPassword, password)
    }
}
