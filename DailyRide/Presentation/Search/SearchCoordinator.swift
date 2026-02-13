//
//  SearchCoordinator.swift
//  DailyRide
//
//  Created by Kumari Bhavana on 13/02/26.
//

import SwiftUI

struct SearchCoordinator: View {

    let container: AppContainer

    var body: some View {
        let viewModel = SearchViewModel(searchUseCase: container.searchUseCase)
        SearchView(viewModel: viewModel)
    }
}
