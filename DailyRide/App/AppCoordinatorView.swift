//
//  AppCoordinatorView.swift
//  DailyRide
//
//  Created by Kumari Bhavana on 24/01/26.
//

import SwiftUI
import Combine

struct AppCoordinatorView: View {

    @ObservedObject var coordinator: AppCoordinator

    var body: some View {
        coordinator.rootView.task {
             coordinator.start()
        }
    }
}
