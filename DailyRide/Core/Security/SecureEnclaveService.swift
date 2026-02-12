//
//  SecureEnclaveService.swift
//  DailyRide
//
//  Created by Kumari Bhavana on 12/02/26.
//

import LocalAuthentication
import Security

final class SecureEnclaveService {

    func generateKeyPair() throws {
        let attributes: [String: Any] = [
            kSecAttrKeyType as String: kSecAttrKeyTypeECSECPrimeRandom,
            kSecAttrKeySizeInBits as String: 256,
            kSecAttrTokenID as String: kSecAttrTokenIDSecureEnclave,
            kSecPrivateKeyAttrs as String: [
                kSecAttrIsPermanent as String: true,
                kSecAttrApplicationTag as String: "com.dailyrides.securekey"
            ]
        ]

        SecKeyCreateRandomKey(attributes as CFDictionary, nil)
    }
}
