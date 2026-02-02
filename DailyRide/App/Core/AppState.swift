//
//  AppState.swift
//  DailyRide
//
//  Created by Kumari Bhavana on 02/02/26.
//

import Foundation
import Combine

enum AppFlow {
    case auth
    case dashboard
}

@MainActor
final class AppState: ObservableObject {
    @Published var flow: AppFlow = .auth
}
