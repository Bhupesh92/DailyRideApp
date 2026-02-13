//
//  SearchViewModelTests.swift
//  DailyRideTests
//
//  Created by Kumari Bhavana on 13/02/26.
//

import XCTest
@testable import DailyRide

@MainActor
final class SearchViewModelTests: XCTest {
    private var viewModel: SearchViewModel!
    private var mockUseCase: SearchUseCase!

    override func setUp() {
        super.setUp()
        mockUseCase = MockSearchUseCase()
        viewModel = SearchViewModel(searchUseCase: mockUseCase)
    }

    override func tearDown() {
        viewModel = nil
        mockUseCase = nil
        super.tearDown()
    }
    
    func test_searchSuccessfull() async {
        // Given Arrange
        viewModel.searchText = "test"

        // When Act
        await viewModel.search()

        // Then asset
        XCTAssertNil(viewModel.searchItems)
        XCTAssertNil(viewModel.errorMessage)
        XCTAssertFalse(viewModel.isLoading)
    }
}
