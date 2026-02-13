//
//  SearchRepositoryImpl.swift
//  DailyRide
//
//  Created by Kumari Bhavana on 13/02/26.
//

import Foundation
final class SearchRepositoryImpl: SearchRepository {
    
    var networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func search(with text: String) async throws -> SearchItem {
        guard !text.isEmpty else {
            throw SearchError.noSearch
        }
        
        let requestBody = try JSONEncoder().encode([
            "searchText": text
        ])

        let endpoint = AuthEndpoint.search

        let searchItemDTO: SearchItemDTO = try await networkService.request(
            endpoint: endpoint,
            body: requestBody
        )
        
        return searchItemDTO.toDomain()
    }
}
