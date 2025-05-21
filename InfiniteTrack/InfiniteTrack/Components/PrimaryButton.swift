//
//  PrimaryButton.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 20/05/25.
//

import SwiftUI

struct PrimaryButton: View {
    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, minHeight: 50)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.primary500)
                )
        }
    }
}
