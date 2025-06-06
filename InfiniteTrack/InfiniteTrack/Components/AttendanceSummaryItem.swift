//
//  AttendanceSummaryItem.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 05/06/25.
//

import SwiftUI

struct AttendanceSummaryItem: View {
    let title: String
    let time: String

    var body: some View {
        VStack {
            Text(time)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.dark500)

            Text(title)
                .font(.system(size: 10, weight: .regular))
                .foregroundColor(.dark500)
        }
        .frame(maxWidth: .infinity)
        .padding(10)
        .background(Color.primary100.opacity(0.3))
        .cornerRadius(12)
        .padding(.horizontal, 10)
    }
}
