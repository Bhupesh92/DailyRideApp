//
//  UserDTO.swift
//  DailyRide
//
//  Created by Kumari Bhavana on 24/01/26.
//

import Foundation

struct UserDTO: Codable {
    let id: String
    let full_name: String
    let email_address: String
    let auth_token: String?
}

extension UserDTO {
    func toDomain() -> User {
        User(
            id: id,
            name: full_name,
            email: email_address
        )
    }
}

extension User {
    func toDTO() -> UserDTO {
        UserDTO(
            id: id,
            full_name: name,
            email_address: email,
            auth_token: nil
        )
    }
}
