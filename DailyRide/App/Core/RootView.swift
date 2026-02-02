//
//  RootView.swift
//  DailyRide
//
//  Created by Kumari Bhavana on 02/02/26.
//

import SwiftUI

struct RootView: View {

    @StateObject private var appState = AppState()
    private let appContainer = AppContainer()

    var body: some View {
        switch appState.flow {
        case .auth:
            AuthCoordinator(
                appState: appState,
                container: appContainer
            )

        case .dashboard:
            DashboardCoordinator(
                appState: appState,
                container: appContainer
            )
        }
    }
}
