//
//  TimeOffRequestCardView.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 15/05/25.
//

import SwiftUI

struct TimeOffRequestCardView: View {
    let profileImage: Image
    let name: String
    let role: String
    let leaveStartDate: String
    let leaveEndDate: String
    let timeAgo: String

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            profileImage
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 44, height: 44)
                .clipShape(RoundedRectangle(cornerRadius: 8))

            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(name)
                        .font(.system(size: 10, weight: .medium))
                        .foregroundColor(.dark500)

                    Spacer()

                    Text(timeAgo)
                        .font(.system(size: 8, weight: .thin))
                        .foregroundColor(.dark500)
                }

                Text(role)
                    .font(.system(size: 10, weight: .thin))
                    .foregroundColor(.dark200)

                Text("Leave Start Date: \(leaveStartDate) - Leave End Date: \(leaveEndDate)")
                    .font(.system(size: 8, weight: .medium))
                    .foregroundColor(.primary500)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.05), radius: 3, x: 0, y: 2)
        )
        .padding(4)
    }
}

#Preview {
    TimeOffRequestCardView(profileImage: Image("Profile"), name: "Nabila", role: "Tech Web Mentor", leaveStartDate: "24 Mar 2025", leaveEndDate: "25 Mar 2025", timeAgo: "5 minutes ago")
}
