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
                    .textFieldStyle(.roundedBorder)
                SecureField("Password", text: $viewModel.password).textFieldStyle(.roundedBorder)
                
                Button("Login") {
                    Task {
                        await viewModel.login()
                    }
                }
                
                if viewModel.isLoading {
                    ProgressView()
                }
                
                if let error = viewModel.error {
                    Text(error)
                        .foregroundColor(.red)
                        .font(.footnote)
                }
                
                Button("Don’t have an account? Sign Up") {
                    onSignUpTapped()
                }
                .font(.footnote)
                
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

