//
//  DashboardCoordinator.swift
//  DailyRide
//
//  Created by Kumari Bhavana on 02/02/26.
//

import SwiftUI

struct DashboardCoordinator: View {

    @ObservedObject var appState: AppState
    let container: AppContainer

    var body: some View {
        let viewModel = DashboardViewModel()

        DashboardView(
            viewModel: viewModel,
            container: container,
            onLogout: {
                appState.flow = .auth
            }
        )
    }
}
