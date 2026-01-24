//
//  APIError.swift
//  DailyRide
//
//  Created by Kumari Bhavana on 24/01/26.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case networkError(Error)
    case invalidResponse
    case decodingError
    case unauthorized
    case serverError(statusCode: Int)
}
