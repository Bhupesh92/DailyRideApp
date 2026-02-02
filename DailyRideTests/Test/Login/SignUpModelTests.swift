//
//  SignUpModelTest.swift
//  DailyRideTests
//
//  Created by Kumari Bhavana on 02/02/26.
//

import XCTest
@testable import DailyRide

@MainActor
final class SignUpModelTests: XCTestCase {
    
    var viewModel: SignUpViewModel!
    var useCase: MockSignUpUseCase!
    
    override func setUp() {
            super.setUp()
        useCase = MockSignUpUseCase()
        viewModel = SignUpViewModel(signUpUseCase: useCase)
        
    }
    
    override func tearDown() {
        super.tearDown()
        useCase = nil
        viewModel = nil
    }
    
    // MARK: - Success Case

    func test_signup_success_setsSuccessFlag() async {
        // Given Arrange
        viewModel.email = "test@mail.com"
        viewModel.password = "password123"

        // When Act
        await viewModel.signUp()

        // Then asset
        XCTAssertTrue(viewModel.isSignUpSuccessful)
        XCTAssertNil(viewModel.errorMessage)
        XCTAssertFalse(viewModel.isLoading)
    }

    // MARK: - Failure Case

    func test_signup_failure_setsErrorMessage() async {
        // Given
        useCase.shouldThrowError = true
        viewModel.email = "wrong@mail.com"
        viewModel.password = "wrong"

        // When
        await viewModel.signUp()

        // Then
        XCTAssertFalse(viewModel.isSignUpSuccessful)
        XCTAssertNotNil(viewModel.errorMessage)
        XCTAssertFalse(viewModel.isLoading)
    }

    // MARK: - Loading State

    func test_signup_setsLoadingStateCorrectly() async {
        // Given
        viewModel.email = "test@mail.com"
        viewModel.password = "password123"

        // When
        let task = Task {
            await viewModel.signUp()
        }

        // Then (immediately after calling)
        XCTAssertTrue(viewModel.isLoading)

        await task.value
        XCTAssertFalse(viewModel.isLoading)
    }
}
    
