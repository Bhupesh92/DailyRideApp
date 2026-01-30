//  DailyRideApp.swift
//  DailyRide
//
//  Created by Kumari Bhavana on 22/01/26.
//

import SwiftUI

/*
 Its job is to:
 Create the root AppContainer
 Create the AppCoordinator
 Start the app flow
 Host the root SwiftUI view
 */

@main
struct DailyRideApp: App {
    
    // MARK: - Core App Objects
    
    private let appContainer: AppContainer
    private let appCoordinator: AppCoordinator

    init() {
        let container = AppContainer()
        self.appContainer = container
        self.appCoordinator = AppCoordinator(container: container)
    }
    
    // MARK: - Initialization
    var body: some Scene {
        WindowGroup {
            AppCoordinatorView(coordinator: appCoordinator)
                .onAppear {
                    if CommandLine.arguments.contains("--ui-testing") {
                        AppEnvironment.shared.configureForUITests()
                    }
                }
        }
    }
}
