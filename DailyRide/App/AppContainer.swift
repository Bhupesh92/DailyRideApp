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
        URLSessionNetworkService()
    }()

    lazy var secureStorage: SecureStorage = {
        KeychainStorage()
    }()


    // MARK: - Repositories
    
    lazy var authRepository: AuthRepository = {
        AuthRepositoryImpl(
            networkService: networkService,
            secureStorage: secureStorage
        )
    }()


    // MARK: - Use Cases (Domain Layer)
    
    // Auth

    lazy var signUpUseCase = SignUpUseCaseImpl(
        repository: authRepository
    )
}

