//
//  ProfileViewModel.swift
//  DailyRide
//
//  Created by Kumari Bhavana on 02/02/26.
//

import Combine

@MainActor
final class ProfileViewModel: ObservableObject {

    // MARK: - State

    @Published var userName: String = ""
    @Published var email: String = ""

    private let authRepository: AuthRepository

    // MARK: - Init

    init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }

    // MARK: - Actions

    func loadProfile() async {
//        do {
//            let user = try await authRepository.getCurrentUser()
//            userName = user.name
//            email = user.email
//        } catch {
//            print("Failed to load profile")
//        }
    }

    func logout() async {
        do {
            try await authRepository.logout()
        }
        catch {
            print("Error in logout")
        }
        
    }
}
