//
//  FullScreenRouterView.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 19/05/25.
//

import SwiftUI

struct FullScreenRouterView: View {
    @EnvironmentObject var navState: NavigationState

    var body: some View {
        NavigationStack {
            if let destinationView = navState.fullScreenView {
                destinationView
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button(action: {
                                navState.dismissFullScreen()
                            }) {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.blue)
                            }
                        }
                    }
            } else {
                // Optional fallback view
                Text("No screen to show")
                    .onAppear {
                        navState.isShowingFullScreenView = false
                    }
            }
        }
    }
}

