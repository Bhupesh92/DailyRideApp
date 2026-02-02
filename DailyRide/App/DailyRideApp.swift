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
    
    // MARK: - Initialization
    var body: some Scene {
        WindowGroup {
            RootView().onAppear {
                if CommandLine.arguments.contains("--ui-testing") {
                    AppEnvironment.shared.configureForUITests()
                }
            }
        }
    }
}
