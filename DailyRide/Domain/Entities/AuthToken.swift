//
//  AuthToken.swift
//  DailyRide
//
//  Created by Kumari Bhavana on 11/02/26.
//

import Foundation
struct AuthToken: Codable {
    let accessToken: String
    let refreshToken: String
    let expiryDate: Date
}
