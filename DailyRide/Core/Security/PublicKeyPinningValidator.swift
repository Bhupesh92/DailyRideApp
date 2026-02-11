//
//  PublicKeyPinningValidator.swift
//  DailyRide
//
//  Created by Kumari Bhavana on 10/02/26.
//

import Foundation
import Security
import CryptoKit

final class PublicKeyPinningValidator {

    private let pinnedKeyHashes: Set<String>

    init(pinnedKeyHashes: [String]) {
        self.pinnedKeyHashes = Set(pinnedKeyHashes)
    }

    func validate(serverTrust: SecTrust) -> Bool {
        guard let serverKey = extractPublicKey(from: serverTrust),
              let serverKeyHash = hash(publicKey: serverKey)
        else {
            return false
        }

        return pinnedKeyHashes.contains(serverKeyHash)
    }

    private func extractPublicKey(from trust: SecTrust) -> SecKey? {
        let policy = SecPolicyCreateSSL(true, nil)
        SecTrustSetPolicies(trust, policy)
        return SecTrustCopyKey(trust)
    }

    private func hash(publicKey: SecKey) -> String? {
        guard let keyData = SecKeyCopyExternalRepresentation(publicKey, nil) as Data? else {
            return nil
        }

        let hash = SHA256.hash(data: keyData)
        return Data(hash).base64EncodedString()
    }
}
