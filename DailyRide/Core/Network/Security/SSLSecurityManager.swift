//
//   SSLSecurityManager.swift
//  DailyRide
//
//  Created by Kumari Bhavana on 10/02/26.
//

import Foundation
import Security

final class SSLSecurityManager: NSObject, URLSessionDelegate {

  //  private let pinnedCertificateData: Data
    private let validator: PublicKeyPinningValidator

    init(validator: PublicKeyPinningValidator) {
//        guard let certPath = Bundle.main.path(
//            forResource: "api_yourdomain_com",
//            ofType: "cer"
//        ),
//        let certData = NSData(contentsOfFile: certPath) as Data? else {
//            fatalError("Pinned certificate not found")
//        }
//
//        self.pinnedCertificateData = certData
        self.validator = validator
        super.init()
    }

    func urlSession(
        _ session: URLSession,
        didReceive challenge: URLAuthenticationChallenge,
        completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void
    ) {
//        guard challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust,
//              let serverTrust = challenge.protectionSpace.serverTrust,
//              let serverCertificate = SecTrustGetCertificateAtIndex(serverTrust, 0)
//        else {
//            completionHandler(.cancelAuthenticationChallenge, nil)
//            return
//        }
//
//        let serverCertificateData = SecCertificateCopyData(serverCertificate) as Data
//
//        if serverCertificateData == pinnedCertificateData {
//            let credential = URLCredential(trust: serverTrust)
//            completionHandler(.useCredential, credential)
//        } else {
//            completionHandler(.cancelAuthenticationChallenge, nil)
//        }
        guard challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust,
              let serverTrust = challenge.protectionSpace.serverTrust
        else {
            completionHandler(.performDefaultHandling, nil)
            return
        }

        if validator.validate(serverTrust: serverTrust) {
            completionHandler(.useCredential, URLCredential(trust: serverTrust))
        } else {
            completionHandler(.cancelAuthenticationChallenge, nil)
        }

    }
}
