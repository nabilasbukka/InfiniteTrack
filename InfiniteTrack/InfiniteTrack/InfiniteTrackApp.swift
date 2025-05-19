//
//  InfiniteTrackApp.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 26/09/24.
//

import SwiftUI

@main
struct InfiniteTrackApp: App {
    @StateObject var navState = NavigationState()

    var body: some Scene {
        WindowGroup {
            if navState.isShowingFullScreenView {
                FullScreenRouterView()
                    .environmentObject(navState)
            } else {
                MainTabView()
                    .environmentObject(navState)
            }
        }
    }
}
