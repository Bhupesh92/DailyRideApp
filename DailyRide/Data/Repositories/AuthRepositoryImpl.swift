//
//  AuthRepositoryImpl.swift
//  DailyRide
//
//  Created by Kumari Bhavana on 22/01/26.
//

import Foundation

final class AuthRepositoryImpl: AuthRepository {
    
    var networkService: NetworkService
    var sessionManager: SessionManager
    
    init(networkService: NetworkService, sessionManager: SessionManager) {
        self.networkService = networkService
        self.sessionManager = sessionManager
    }

    func login(
        email: String,
        password: String
    ) async throws -> User {
        
        return User(id: "124", name: "Bhupesh", email: "Brx@gmail.com")
        
//        let requestBody = try JSONEncoder().encode([
//            "email": email,
//            "password": password
//        ])
//
//        let endpoint = AuthEndpoint.login
//
//        let userDTO: UserDTO = try await networkService.request(
//            endpoint: endpoint,
//            body: requestBody
//        )
//
//        let token = AuthToken(
//            accessToken: userDTO.auth_token ?? "",
//            refreshToken: userDTO.refresh_token  ?? "",
//            expiryDate: Date().addingTimeInterval(86400) // 24 hours
//        )
//
//        try sessionManager.saveToken(token)
//        return userDTO.toDomain()
    }
    
    func refreshToken() async throws -> String {
        
        guard let refreshToken = try sessionManager.getRefreshToken() else {
            throw APIError.unauthorized
        }
        
        let requestBody = try JSONEncoder().encode([
            "refreshToken": refreshToken,
        ])

        let endpoint = AuthEndpoint.login

        let userDTO: UserDTO = try await networkService.request(
            endpoint: endpoint,
            body: requestBody
        )

        let newToken = AuthToken(
            accessToken: userDTO.auth_token ?? "",
            refreshToken: userDTO.refresh_token ?? "",
            expiryDate: Date().addingTimeInterval(86400)
        )

        try sessionManager.saveToken(newToken)
        
        return newToken.accessToken
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
        
        let newToken = AuthToken(
            accessToken: userDTO.auth_token ?? "",
            refreshToken: userDTO.refresh_token ?? "",
            expiryDate: Date().addingTimeInterval(86400)
        )

        try sessionManager.saveToken(newToken)
                
        return userDTO.toDomain()
    }

    func logout() async throws {
        try sessionManager.clearSession()
    }
    
    func getCurrentUser() async throws -> User {
        // Check if token exists in secure storage
//        guard let token = try? secureStorage.get(for: "auth_token") else {
//            throw APIError.unauthorized
//        }
        
        // Optionally, you can validate the token with the backend here
        
        // For simplicity, we'll just return a dummy user
        return User(
            id: "123",
            name: "Persisted User",
            email: "")
    }
    
}
