//
//  SignUpView.swift
//  DailyRide
//
//  Created by Kumari Bhavana on 25/01/26.
//

import SwiftUI

/*
 
 Features
 └── Auth
     └── SignUp
         ├── SignUpView.swift        ✅ UI
         ├── SignUpViewModel.swift   ✅ Presentation logic
         └── SignUpCoordinator.swift (optional, for navigation)


 */

struct SignUpView: View {

    @StateObject private var viewModel: SignUpViewModel
    private let onSignUpSuccess: () -> Void

    // MARK: - Init (DI-friendly)

    init(
        viewModel: SignUpViewModel,
        onSignUpSuccess: @escaping () -> Void
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.onSignUpSuccess = onSignUpSuccess
    }

    // MARK: - UI

    var body: some View {
        VStack(spacing: 20) {

            Text("Create Account")
                .font(.largeTitle)
                .bold()

            TextField("Full Name", text: $viewModel.name)
                .textFieldStyle(.roundedBorder)

            TextField("Email", text: $viewModel.email)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .textFieldStyle(.roundedBorder)

            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(.roundedBorder)

            if viewModel.isLoading {
                ProgressView()
            }

            Button("Sign Up") {
                Task {
                    await viewModel.signUp()
                }
            }
            .buttonStyle(.borderedProminent)
            .disabled(viewModel.isLoading)

            if let error = viewModel.errorMessage {
                Text(error)
                    .foregroundColor(.red)
                    .font(.footnote)
            }

            Spacer()
        }
        .padding()
        .onChange(of: viewModel.isSignUpSuccessful) { success in
            if success {
                onSignUpSuccess()
            }
        }
    }
}

