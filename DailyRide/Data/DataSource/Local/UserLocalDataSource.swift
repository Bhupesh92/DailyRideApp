//
//  UserLocalDataSource.swift
//  DailyRide
//
//  Created by Kumari Bhavana on 24/01/26.
//

import Foundation
import Security

protocol SecureStorage {
    func save(_ data: Data, for key: String) throws
    func read(for key: String) throws -> Data?
    func delete(for key: String) throws
}

protocol BiometricService {
    func authenticate() async throws -> Bool
}
