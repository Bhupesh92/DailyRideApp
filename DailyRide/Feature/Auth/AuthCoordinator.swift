//
//  LoginCoordinator.swift
//  DailyRide
//
//  Created by Kumari Bhavana on 22/01/26.
//

import SwiftUI

struct AuthCoordinator: View {

    @ObservedObject var appState: AppState
    let container: AppContainer

    var body: some View {
        let viewModel = LoginViewModel(
            loginUseCase: container.loginUseCase
        )

        LoginView(
            viewModel: viewModel,
            onLoginSuccess: {
                appState.flow = .dashboard
            },
            onSignUpTapped: {
                // Navigate to SignUp later
            }
        )
    }
}
