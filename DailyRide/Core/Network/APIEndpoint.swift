//
//  APIEndpoint.swift
//  DailyRide
//
//  Created by Kumari Bhavana on 24/01/26.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

protocol APIEndpoint {
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
}

enum AuthEndpoint: APIEndpoint {
    case login
    case signUp

    var path: String {
        switch self {
        case .login: return "/auth/login"
        case .signUp: return "/auth/signUP"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .login: return .post
        case .signUp: return .post
        }
    }

    var headers: [String : String]? {
        ["Content-Type": "application/json"]
    }
}
