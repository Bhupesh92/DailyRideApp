//
//  SearchView.swift
//  DailyRide
//
//  Created by Kumari Bhavana on 13/02/26.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject private var viewModel: SearchViewModel
        
    init(viewModel: SearchViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        TextField("Search here...", text: $viewModel.searchText).onSubmit {
            Task {
                await viewModel.search()
            }
        }
        List(viewModel.searchItems) { item in
            Text(item.name)
        }
        Spacer()
    }
}
