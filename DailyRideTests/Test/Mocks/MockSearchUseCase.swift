//
//  MockSearchUseCase.swift
//  DailyRideTests
//
//  Created by Kumari Bhavana on 13/02/26.
//

import Foundation
@testable import DailyRide
// 👉 You can mock either repository or use case.
class MockSearchUseCase: SearchUseCase {
    var shouldThrowError = false
    var repo = MockSearchRepository()
    func search(with text: String) async throws -> DailyRide.SearchItem {
        repo.shouldThrowError = shouldThrowError
        return try await repo.search(with: text)
    }
}
