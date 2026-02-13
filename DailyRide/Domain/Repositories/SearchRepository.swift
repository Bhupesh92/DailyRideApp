//
//  SearchRepository.swift
//  DailyRide
//
//  Created by Kumari Bhavana on 13/02/26.
//

import Foundation
protocol SearchRepository {
    func search(with text: String) async throws -> SearchItem
}
