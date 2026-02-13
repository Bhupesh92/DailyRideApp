//
//  SearchUseCase.swift
//  DailyRide
//
//  Created by Kumari Bhavana on 13/02/26.
//

import Foundation
protocol SearchUseCase {
    func search(with text: String) async throws -> SearchItem
}

final class SearchUseCaseImpl: SearchUseCase {
    private let repository: SearchRepository
    
    init(repository: SearchRepository) {
        self.repository = repository
    }
    
    func search(with text: String) async throws -> SearchItem {
        return try await repository.search(with: text)
    }
}
