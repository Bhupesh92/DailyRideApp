//
//  AuthResponseDTO.swift
//  DailyRide
//
//  Created by Kumari Bhavana on 11/02/26.
//

import Foundation

struct AuthResponseDTO: Decodable {
    let accessToken: String
    let refreshToken: String
    let expiresIn: TimeInterval
}
