//
//  URLSessionNetworkService.swift
//  DailyRide
//
//  Created by Kumari Bhavana on 24/01/26.
//

import Foundation


final class URLSessionNetworkService: NetworkService {

    private let session: URLSession
    private let authInterceptor: AuthInterceptor

    init(
        session: URLSession = .shared,
        authInterceptor: AuthInterceptor = DefaultAuthInterceptor(
            tokenProvider: DefaultAuthTokenProvider()
        )
    ) {
        self.session = session
        self.authInterceptor = authInterceptor
    }

    func request<T: Decodable>(
        endpoint: APIEndpoint,
        body: Data? = nil
    ) async throws -> T {

        guard let url = URL(string: AppConstants.baseURL + endpoint.path) else {
            throw APIError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.httpBody = body

        endpoint.headers?.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }

        request = authInterceptor.intercept(request)

        do {
            let (data, response) = try await session.data(for: request)

            guard let httpResponse = response as? HTTPURLResponse else {
                throw APIError.invalidResponse
            }

            switch httpResponse.statusCode {
            case 200...299:
                return try JSONDecoder().decode(T.self, from: data)
            case 401:
                throw APIError.unauthorized
            default:
                throw APIError.serverError(statusCode: httpResponse.statusCode)
            }

        } catch let error as APIError {
            throw error
        } catch {
            throw APIError.networkError(error)
        }
    }
}
