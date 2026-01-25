//
//  UserLocalDataSource.swift
//  DailyRide
//
//  Created by Kumari Bhavana on 24/01/26.
//

import Foundation

protocol SecureStorage {
    func save(_ value: String, for key: String)
    func get(for key: String) -> String?
    func remove(for key: String)
}

final class KeychainStorage: SecureStorage {

    private var storage: [String: String] = [:]

    func save(_ value: String, for key: String) {
        storage[key] = value
    }

    func get(for key: String) -> String? {
        storage[key]
    }

    func remove(for key: String) {
        storage.removeValue(forKey: key)
    }
}
