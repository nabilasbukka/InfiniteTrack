//
//  AttendanceRankCardView.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 16/05/25.
//

import SwiftUI

struct AttendanceRankCardView: View {
    let rank: String
    let profileImage: Image
    let name: String
    let checkinTime: String
    let timeAgo: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Text(rank)
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(.dark500)
            
            profileImage
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 44, height: 44)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(name)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.dark500)
                    
                    Spacer()
                    
                    Text(timeAgo)
                        .font(.system(size: 12, weight: .thin))
                        .foregroundColor(.dark500)
                }
                Text("Check in: \(checkinTime)")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.primary500)
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.05), radius: 3, x: 0, y: 2)
        )
    }
}

#Preview {
    AttendanceRankCardView(rank: "1", profileImage: Image("img_profile"), name: "Nabila", checkinTime: "08:00", timeAgo: "5 minutes ago")
}
