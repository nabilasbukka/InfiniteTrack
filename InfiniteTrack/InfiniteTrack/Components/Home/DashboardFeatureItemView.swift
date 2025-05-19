//
//  DashboardFeatureItemView.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 14/05/25.
//

import SwiftUI

struct DashboardFeatureItemView: View {
    var imageName: String
    var title: String
    var onTap: (() -> Void)? = nil
    
    var body: some View {
        VStack(spacing: 8) {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 31.88, height: 32)
            
            Text(title)
                .font(.system(size: 10, weight: .medium))
                .multilineTextAlignment(.center)
                .foregroundColor(.dark500)
        }
        .frame(width: 76, height: 64)
        .padding(8)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.primary500.opacity(0.5), lineWidth: 1)
        )
        .contentShape(Rectangle())
        .onTapGesture {
            onTap?()
        }
    }
}

#Preview {
    DashboardFeatureItemView(imageName: "ic_live_attendance", title: "Live Attendance")
}
