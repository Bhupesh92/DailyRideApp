//
//  LoginView.swift
//  DailyRide
//
//  Created by Kumari Bhavana on 22/01/26.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject private var viewModel: LoginViewModel
    

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
                
                Spacer()

            }
            .padding()
            .navigationTitle("Home")
    }
}

