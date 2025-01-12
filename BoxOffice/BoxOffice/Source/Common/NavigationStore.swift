//
//  NavigationStore.swift
//  BoxOffice
//
//  Created by 최안용 on 1/12/25.
//

import SwiftUI

final class NavigationStore: ObservableObject {
    @Published var path: [ViewType] = []
    
    @ViewBuilder
    func bulid(_ view: ViewType) -> some View {
        switch view {
        case .movieDetail(let movieId):
            MovieDetailView(movieId: movieId)
        }
    }
    
    func dispatch(_ intent: NavigationIntent) {
        switch intent {
        case .push(let view):
            path.append(view)
        case .pop:
            path.removeLast()
        }
    }
}
