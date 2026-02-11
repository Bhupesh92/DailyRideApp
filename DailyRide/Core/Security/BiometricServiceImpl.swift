//
//  BiometricServiceImpl.swift
//  DailyRide
//
//  Created by Kumari Bhavana on 11/02/26.
//

import Foundation
import LocalAuthentication

final class BiometricServiceImpl: BiometricService {

    func authenticate() async throws -> Bool {
        let context = LAContext()
        let reason = "Authenticate to login"

        return try await withCheckedThrowingContinuation { continuation in
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                                   localizedReason: reason) { success, error in
                if success {
                    continuation.resume(returning: true)
                } else {
                    continuation.resume(throwing: error ?? NSError())
                }
            }
        }
    }
    
}
