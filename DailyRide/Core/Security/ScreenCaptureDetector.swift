//
//  ScreenCaptureDetector.swift
//  DailyRide
//
//  Created by Kumari Bhavana on 12/02/26.
//

import UIKit

final class ScreenCaptureDetector {

    static func startMonitoring() {
        NotificationCenter.default.addObserver(
            forName: UIScreen.capturedDidChangeNotification,
            object: nil,
            queue: .main
        ) { _ in
            if UIScreen.main.isCaptured {
                print("Screen recording detected")
            }
        }
    }
}
