//
//  NetworkService.swift
//  DailyRide
//
//  Created by Kumari Bhavana on 24/01/26.
//

import Foundation

protocol NetworkService {
    func request<T: Decodable>(
        endpoint: APIEndpoint,
        body: Data?
    ) async throws -> T
}

