//
//  SignUpViewModel.swift
//  DailyRide
//
//  Created by Kumari Bhavana on 25/01/26.
//

import Combine
import Foundation

@MainActor
final class SignUpViewModel: ObservableObject {

    // MARK: - Input (View → ViewModel)

    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""

    // MARK: - Output (View listens)

    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var isSignUpSuccessful: Bool = false

    // MARK: - Dependency

    private let signUpUseCase: SignUpUseCase

    // MARK: - Init

    init(signUpUseCase: SignUpUseCase) {
        self.signUpUseCase = signUpUseCase
    }

    // MARK: - Action

    func signUp() async {
        isLoading = true
        errorMessage = nil
        
        defer {
            isLoading = false
        }

        do {
            _ = try await signUpUseCase.execute(
                name: name,
                email: email,
                password: password
            )
            isSignUpSuccessful = true
        } catch {
            errorMessage = error.localizedDescription
        }

    }
}
