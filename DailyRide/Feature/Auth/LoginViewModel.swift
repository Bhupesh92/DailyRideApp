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
    @Published var email = ""
    @Published var password = ""
    @Published var isLoading = false
    @Published var error: String?

    private let loginUseCase: LoginUseCase

    init(loginUseCase: LoginUseCase) {
        self.loginUseCase = loginUseCase
    }

    func login() async {
        isLoading = true
        defer { isLoading = false }

        do {
            let user = try await loginUseCase.execute(
                email: email,
                password: password
            )
            print("Logged in user:", user)
        } catch {
            self.error = error.localizedDescription
        }
    }
}
