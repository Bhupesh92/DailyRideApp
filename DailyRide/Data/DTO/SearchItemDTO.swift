//
//  SearchItemDTO.swift
//  DailyRide
//
//  Created by Kumari Bhavana on 13/02/26.
//

import Foundation

struct SearchItemDTO: Codable {
    let name: String
    let posterId: String
}

extension SearchItemDTO {
    func toDomain() -> SearchItem {
        SearchItem(name: name, posterID: posterId)
    }
}

extension SearchItem {
    func toDTO() -> SearchItemDTO {
        SearchItemDTO(name: name, posterId: posterID)
    }
}
