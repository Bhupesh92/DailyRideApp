//
//  ProfileCoordinator.swift
//  DailyRide
//
//  Created by Kumari Bhavana on 02/02/26.
//


import SwiftUI

struct ProfileCoordinator: View {
    let container: AppContainer
    let onLogout: () -> Void

    var body: some View {
        let viewModel = ProfileViewModel(
            authRepository: container.authRepository
        )

        ProfileView(
            viewModel: viewModel,
            onLogout: onLogout
        )
    }
}
