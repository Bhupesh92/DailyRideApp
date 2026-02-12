//
//  DeviceBindingInterceptor.swift
//  DailyRide
//
//  Created by Kumari Bhavana on 12/02/26.
//

import UIKit

final class DeviceBindingInterceptor {

    func addDeviceId(to request: URLRequest) -> URLRequest {
        var request = request
        let deviceId = UIDevice.current.identifierForVendor?.uuidString ?? ""
        request.setValue(deviceId, forHTTPHeaderField: "X-Device-ID")
        return request
    }
}
