//
//  SecurityBootstrapper.swift
//  DailyRide
//
//  Created by Kumari Bhavana on 12/02/26.
//

import Foundation
final class SecurityBootstrapper {

    static func initialize() {

        if JailbreakDetector.isJailbroken() {
            fatalError("App cannot run on jailbroken device")
        }

        if DebuggerDetector.isDebuggerAttached() {
          //  fatalError("Debugger detected")
        }

        ScreenCaptureDetector.startMonitoring()
    }
}
