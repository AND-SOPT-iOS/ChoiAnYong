//
//  NavigationDomain.swift
//  BoxOffice
//
//  Created by 최안용 on 1/12/25.
//

import Foundation

enum NavigationIntent {
    case push(ViewType)
    case pop
}

enum ViewType: Hashable {
    case movieDetail(String)
}
