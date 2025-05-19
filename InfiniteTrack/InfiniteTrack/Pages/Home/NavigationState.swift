//
//  NavigationState.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 19/05/25.
//

import SwiftUI

class NavigationState: ObservableObject {
    @Published var isShowingFullScreenView: Bool = false
    @Published var fullScreenView: AnyView? = nil

    func presentFullScreen(view: AnyView) {
        self.fullScreenView = view
        self.isShowingFullScreenView = true
    }

    func dismissFullScreen() {
        self.isShowingFullScreenView = false
        self.fullScreenView = nil
    }
}
