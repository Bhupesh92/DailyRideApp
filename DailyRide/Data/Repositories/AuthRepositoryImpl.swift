//
//  AuthRepositoryImpl.swift
//  DailyRide
//
//  Created by Kumari Bhavana on 22/01/26.
//

import Foundation

final class AuthRepositoryImpl: AuthRepository {
    
    var networkService: NetworkService
    var secureStorage: SecureStorage
    
    init(networkService: NetworkService, secureStorage: SecureStorage) {
        self.networkService = networkService
        self.secureStorage = secureStorage
    }

    func login(
        email: String,
        password: String
    ) async throws -> User {
        
        let requestBody = try JSONEncoder().encode([
            "email": email,
            "password": password
        ])

        let endpoint = AuthEndpoint.login

        let userDTO: UserDTO = try await networkService.request(
            endpoint: endpoint,
            body: requestBody
        )

     //   persistSession(from: userDTO)

        return userDTO.toDomain()
    }

    func signUp(
        name: String,
        email: String,
        password: String
    ) async throws -> User {
        let requestBody = try JSONEncoder().encode([
            "name": name,
            "email": email,
            "password": password
        ])
        
        let endpoint = AuthEndpoint.signUp
        
        let userDTO: UserDTO = try await networkService.request(
            endpoint: endpoint,
            body: requestBody
        )
        
       // persistSession(from: userDTO)
        
        return userDTO.toDomain()
    }

    func logout() {
    }

    func isUserLoggedIn() -> Bool {
        return false
    }

}
