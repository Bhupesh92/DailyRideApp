//
//  SearchViewModel.swift
//  DailyRide
//
//  Created by Kumari Bhavana on 13/02/26.
//

import SwiftUI
import Combine

class SearchViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var isLoading: Bool = false
    @Published var errorMessage: String = ""
    
    @Published var searchItems = [SearchItem]()
    
    private let searchUseCase: SearchUseCase
    
    // Usecase
    init(searchUseCase: SearchUseCase) {
        self.searchUseCase = searchUseCase
    }
    
    func search() async {
        isLoading = true
        defer {
            isLoading = false
        }
        do {
            searchItems.append(try await searchUseCase.search(with: searchText))
        } catch let  error {
            errorMessage = error.localizedDescription
        }
    }
}
