//
//  AppCoordinator.swift
//  DailyRide
//
//  Created by Kumari Bhavana on 22/01/26.
//

import Foundation
import SwiftUI
import Combine

final class AppCoordinator: ObservableObject {
    
    @Published var rootView: AnyView = AnyView(EmptyView())

    private let container: AppContainer

    init(container: AppContainer) {
        self.container = container
    }

    func start() {
        if isUserLoggedIn() {
           // showDashboard()
        } else {
            showLogin()
        }
    }
    
    func showLogin() {
        let viewModel = LoginViewModel(
            loginUseCase: container.loginUseCase
        )

        let view = LoginView(
            viewModel: viewModel,
            onLoginSuccess: { [weak self] in
                //self?.showDashboard()
            },
            onSignUpTapped: { [weak self] in
                self?.showSignUp()
            }
        )

        rootView = AnyView(view)
    }

    
    func showSignUp() {
        let viewModel = SignUpViewModel(
            signUpUseCase: container.signUpUseCase
        )
        
        let view = SignUpView(
            viewModel: viewModel,
            onSignUpSuccess: { [weak self] in
                //  self?.showDashboard()
            }
        )
        rootView = AnyView(view)
    }

    
    private func isUserLoggedIn() -> Bool {
        return false
    }
}
