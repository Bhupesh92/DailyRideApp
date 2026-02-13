//
//  MockSearchRepository.swift
//  DailyRideTests
//
//  Created by Kumari Bhavana on 13/02/26.
//

@testable import DailyRide
import Foundation

class MockSearchRepository: SearchRepository {
    
    var shouldThrowError = false
    var receivedSearchitem = false

    func search(with text: String) async throws -> DailyRide.SearchItem {

        if shouldThrowError {
            receivedSearchitem = false
            throw SearchError.noSearch
        }
        receivedSearchitem = true
        return SearchItem(name: "Test", posterID: "123.png")
    }
}
