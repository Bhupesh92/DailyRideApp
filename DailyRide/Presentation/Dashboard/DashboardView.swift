//
//  DashboardView.swift
//  DailyRide
//
//  Created by Kumari Bhavana on 02/02/26.
//

import SwiftUI

struct DashboardView: View {

    @StateObject private var viewModel: DashboardViewModel
    let container: AppContainer
    let onLogout: () -> Void

    init(
        viewModel: DashboardViewModel,
        container: AppContainer,
        onLogout: @escaping () -> Void
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.container = container
        self.onLogout = onLogout
    }


    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {

                Text(viewModel.welcomeMessage)
                    .font(.largeTitle)
                    .bold()
                    .accessibilityIdentifier("dashboard_title")
                
                Button("View Profile") {
                    // Navigate to Profile feature
                    viewModel.viewProfile()
                }

                Button("Search Rides") {
                    // Navigate to Search feature
                    viewModel.viewSearch()
                }

                Button("Post Ride") {
                    // Navigate to Post Ride feature
                }

                Button("Logout") {
                    onLogout()
                }
                .foregroundColor(.red)

                Spacer()
            }
            .padding()
            .navigationDestination(
                item: Binding(
                    get: { viewModel.destination },
                    set: { _ in }
                )
            ) { destination in
                switch destination {
                case .profile:
                    ProfileCoordinator(
                        container: container,
                        onLogout: onLogout
                    )
                case .search:
                    SearchCoordinator(container: container)
                }
            }
            .onAppear {
                viewModel.load()
            }
        }
    }
}
