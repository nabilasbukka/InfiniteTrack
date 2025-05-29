//
//  ProfileView.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 14/05/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView {
            VStack {
                InputOTPView()
            }
        }
        .pageBackground()
    }
}

#Preview {
    ProfileView()
}
