//
//  DebuggerDetector.swift
//  DailyRide
//
//  Created by Kumari Bhavana on 12/02/26.
//

import Foundation
import Darwin

final class DebuggerDetector {

    static func isDebuggerAttached() -> Bool {
        var info = kinfo_proc()
        var mib = [CTL_KERN, KERN_PROC, KERN_PROC_PID, getpid()]
        var size = MemoryLayout.stride(ofValue: info)

        sysctl(&mib, 4, &info, &size, nil, 0)

        return (info.kp_proc.p_flag & P_TRACED) != 0
    }
}
