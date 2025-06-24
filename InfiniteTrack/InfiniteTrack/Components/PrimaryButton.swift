//
//  PrimaryButton.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 20/05/25.
//

import SwiftUI

struct PrimaryButton: View {
    @Environment(\.isEnabled) private var isEnabled: Bool
    let title: String
    let action: () -> Void
    @Binding var isLoading: Bool
    
    init(title: String, isLoading: Binding<Bool> = .constant(false), action: @escaping () -> Void) {
        self.title = title
        self.action = action
        self._isLoading = isLoading
    }
    
    var body: some View {
        Button(action: action) {
            ZStack {
                if isLoading {
                    ProgressView()
                        .tint(.white)
                } else {
                    Text(title)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.white)
                }
            }
            .frame(maxWidth: .infinity, minHeight: 50)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.primary500)
            )
            .opacity(isEnabled ? 1.0 : 0.5)
        }
    }
}
