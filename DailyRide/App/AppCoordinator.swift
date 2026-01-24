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

    private func showLogin() {
//        let viewModel = LoginViewModel(
//            loginUseCase: container.loginUseCase
//        )
        // present LoginView
    }
    
    private func isUserLoggedIn() -> Bool {
        return false
    }
}
