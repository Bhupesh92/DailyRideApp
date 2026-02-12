//
//  JailbreakDetector.swift
//  DailyRide
//
//  Created by Kumari Bhavana on 12/02/26.
//

import UIKit

final class JailbreakDetector {

    static func isJailbroken() -> Bool {

        #if targetEnvironment(simulator)
        return false
        #endif

        let suspiciousPaths = [
            "/Applications/Cydia.app",
            "/usr/sbin/sshd",
            "/bin/bash",
            "/etc/apt"
        ]

        for path in suspiciousPaths {
            if FileManager.default.fileExists(atPath: path) {
                return true
            }
        }

        if canOpen(path: "/private/jailbreak.txt") {
            return true
        }

        return false
    }

    private static func canOpen(path: String) -> Bool {
        do {
            try "test".write(toFile: path,
                             atomically: true,
                             encoding: .utf8)
            return true
        } catch {
            return false
        }
    }
}
