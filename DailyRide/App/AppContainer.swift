//
//  AppContainer.swift
//  DailyRide
//
//  Created by Kumari Bhavana on 22/01/26.
//

import Foundation

final class AppContainer {

    // MARK: - Core Services (Singleton-like)
    
    lazy var networkService: NetworkService = {
        let pins = [
            "X9k9l9R9Z2vM4E+6FQKq9c5+Qv+F8K9Y2N0P0abc123=", // current
            "Z8Y7X6W5V4U3T2S1R0NEWKEY456="               // next (rotation)
        ]

        let validator = PublicKeyPinningValidator(pinnedKeyHashes: pins)
        let securityManager = SSLSecurityManager(validator: validator)

        let config = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: config,
                                 delegate: securityManager,
                                 delegateQueue: nil)

        return URLSessionNetworkService(session: session)
    }()

    lazy var sessionManager: SessionManager = {
        SessionManager(storage: KeychainSecureStorage())
    }()


    // MARK: - Repositories
    
    lazy var authRepository: AuthRepository = {
        AuthRepositoryImpl(
            networkService: networkService,
            sessionManager: sessionManager
        )
    }()


    // MARK: - Use Cases (Domain Layer)
    
    // Auth

    lazy var signUpUseCase = SignUpUseCaseImpl(
        repository: authRepository
    )
    
    lazy var loginUseCase = LoginUseCaseImpl(
        repository: authRepository
    )
}

