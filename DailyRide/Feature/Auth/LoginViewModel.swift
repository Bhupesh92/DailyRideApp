//
//  LoginViewModel.swift.swift
//  DailyRide
//
//  Created by Kumari Bhavana on 22/01/26.
//

import Foundation
import SwiftUI
import Combine

@MainActor
final class LoginViewModel: ObservableObject {
    
    // MARK: - Input (View → ViewModel)
    @Published var email = ""
    @Published var password = ""
    
    // MARK: - Output (ViewModel → View)
    @Published var isLoading = false
    @Published var error: String?
    @Published var isLoginSuccessful: Bool = false

    // MARK: - Dependency
    private let loginUseCase: LoginUseCase

    // MARK: - Init
    init(loginUseCase: LoginUseCase) {
        self.loginUseCase = loginUseCase
    }

    // MARK: - Action
    func login() async {
        isLoading = true
        defer { isLoading = false }

        do {
            _ = try await loginUseCase.execute(
                email: email,
                password: password
            )
            isLoginSuccessful = true
        } catch {
            self.error = error.localizedDescription
        }
    }
}
