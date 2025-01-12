//
//  BoxOfficeApp.swift
//  BoxOffice
//
//  Created by 최안용 on 1/5/25.
//

import SwiftUI

@main
struct BoxOfficeApp: App {
    @StateObject private var navigationStore = NavigationStore()
    
    var body: some Scene {
        WindowGroup {
            BoxOfficeView(store: BoxOfficeStore())
                .environmentObject(navigationStore)
        }
    }
}
