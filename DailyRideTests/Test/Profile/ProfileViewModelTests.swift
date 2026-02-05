//
//  ProfileViewModelTests.swift
//  DailyRideTests
//
//  Created by Kumari Bhavana on 05/02/26.
//

@testable import DailyRide
import XCTest

@MainActor
final class ProfileViewModelTests: XCTestCase {

    private var viewModel: ProfileViewModel!
    private var mockAuthRepository: MockAuthRepository!

    override func setUp() {
        super.setUp()
        mockAuthRepository = MockAuthRepository()
        viewModel = ProfileViewModel(authRepository: mockAuthRepository)
    }

    override func tearDown() {
        viewModel = nil
        mockAuthRepository = nil
        super.tearDown()
    }

    // MARK: - Success Case

    func test_loadProfile_success_setsUserData() async {
        // When
        await viewModel.loadProfile()

        // Then
        XCTAssertEqual(viewModel.userName, "Bhupesh Kumar")
        XCTAssertEqual(viewModel.email, "bhupesh@test.com")
    }

    // MARK: - Failure Case

    func test_loadProfile_failure_doesNotCrash() async {
        // Given
        mockAuthRepository.shouldThrowError = true

        // When
        await viewModel.loadProfile()

        // Then
        XCTAssertEqual(viewModel.userName, "")
        XCTAssertEqual(viewModel.email, "")
    }

    // MARK: - Logout

    func test_logout_callsRepositoryLogout() async {
        // When
        await viewModel.logout()

        // Then
        XCTAssertTrue(mockAuthRepository.didCallLogout)
    }
}
