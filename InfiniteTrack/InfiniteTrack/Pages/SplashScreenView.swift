//
//  SplashScreenView.swift
//  InfiniteTrack
//
//  Created by Rizal Hilman on 19/07/25.
//

import SwiftUI


struct SplashScreenView: View {
    var body: some View {
        VStack {
            Image("img_logo")
                .resizable()
                .scaledToFit()
                .frame(height: 150)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .pageBackground()
    }
}

#Preview {
    SplashScreenView()
}
