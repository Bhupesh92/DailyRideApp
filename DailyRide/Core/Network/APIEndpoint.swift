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



enum RideEndpoint: APIEndpoint {
    case login
    case search
    case post

    var path: String {
        switch self {
        case .login: return "/auth/login"
        case .search: return "/rides/search"
        case .post: return "/rides"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .login: return .post
        case .search: return .get
        case .post: return .get
        }
    }

    var headers: [String : String]? {
        ["Content-Type": "application/json"]
    }
}
