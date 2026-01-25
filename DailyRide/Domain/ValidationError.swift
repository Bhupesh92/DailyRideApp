//
//  ValidationError.swift.swift
//  DailyRide
//
//  Created by Kumari Bhavana on 25/01/26.
//

import Foundation

enum ValidationError: Error, LocalizedError {
    case emptyName
    case invalidEmail
    case weakPassword

    var errorDescription: String? {
        switch self {
        case .emptyName:
            return "Name cannot be empty"
        case .invalidEmail:
            return "Invalid email address"
        case .weakPassword:
            return "Password must be at least 6 characters"
        }
    }
}
