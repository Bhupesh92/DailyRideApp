//
//  DashboardViewModel.swift
//  DailyRide
//
//  Created by Kumari Bhavana on 02/02/26.
//

import Combine

@MainActor
final class DashboardViewModel: ObservableObject {

    enum Destination {
        case profile
        case search
    }

    @Published var destination: Destination?
    @Published var welcomeMessage: String = "Welcome to DailyRide"

    func load() {
        // Fetch initial data later
    }
    
    func viewProfile() {
        destination = .profile
    }
    
    func viewSearch() {
        destination = .search
    }
}
