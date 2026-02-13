//
//  LoginView.swift
//  DailyRide
//
//  Created by Kumari Bhavana on 22/01/26.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject private var viewModel: LoginViewModel
    private let onLoginSuccess: () -> Void
    private let onSignUpTapped: () -> Void

    init(viewModel: LoginViewModel,
        onLoginSuccess: @escaping () -> Void,
        onSignUpTapped: @escaping () -> Void) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.onLoginSuccess = onLoginSuccess
        self.onSignUpTapped = onSignUpTapped
    }
    var body: some View {
            VStack(spacing: 24) {
                TextField("Email", text: $viewModel.email).keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .textFieldStyle(.roundedBorder).accessibilityIdentifier("login_email_textfield")
                SecureField("Password", text: $viewModel.password).textFieldStyle(.roundedBorder).accessibilityIdentifier("login_password_textfield")
                
                Button("Login") {
                    Task {
                        await viewModel.login()
                    }
                }.accessibilityIdentifier("login_button")
                
                if viewModel.isLoading {
                    ProgressView()
                }
                
                if let error = viewModel.error {
                    Text(error)
                        .foregroundColor(.red)
                        .font(.footnote).accessibilityIdentifier("login_error_text")
                }
                
                Button("Don’t have an account? Sign Up") {
                    onSignUpTapped()
                }
                .font(.footnote).accessibilityIdentifier("signUp_Log_button")
                
                Spacer()

            }
            .padding()
            .onChange(of: viewModel.isLoginSuccessful) { success in
                if success {
                    onLoginSuccess()
                }
            }
            .navigationTitle("Home")
    }
}

