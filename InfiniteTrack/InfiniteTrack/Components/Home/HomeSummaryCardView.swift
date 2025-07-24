//
//  HomeSummaryCardView.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 14/05/25.
//

import SwiftUI

struct HomeSummaryCardView: View {
    var greetingMessage: String
    var name: String
    var role: String
    var imageProfile: Image
    var availableLeaveCount: String
    var leaveUsedCount: String
    var goToLiveAttendance: () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text(greetingMessage)
                        .foregroundColor(.dark400)
                        .font(.system(size: 14))
                    Text(name)
                        .foregroundColor(.dark500)
                        .font(.system(size: 20))
                    Text(role)
                        .foregroundColor(.dark300)
                        .font(.system(size: 12))
                }
                
                Spacer()
                
                Image("img_profile")
                    .resizable()
                    .frame(width: 34, height: 34)
                    .clipShape(Circle())
            }
            
            // will available soon
            //            VStack(alignment: .leading) {
            //                Text("Available Leave Days")
            //                    .foregroundColor(.black)
            //                    .font(.system(size: 10))
            //                    .fontWeight(.thin)
            //                Text("\(availableLeaveCount) Days")
            //                    .foregroundColor(.dark500)
            //                    .font(.system(size: 20))
            //                Text("\(leaveUsedCount) Used of 10")
            //                    .foregroundColor(.black)
            //                    .font(.system(size: 11))
            //                    .fontWeight(.thin)
            //
            //                ProgressView(value: 0.8)
            //                    .progressViewStyle(LinearProgressViewStyle())
            //                    .accentColor(.primary500)
            //                    .frame(height: 8)
            //                    .background(Color.gray.opacity(0.3))
            //                    .cornerRadius(4)
            //            }
            //            .padding(.top, 12)
            
            HStack(spacing: 87) {
                DashboardFeatureItemView(
                    imageName: "ic_live_attendance",
                    title: "Live Attendance",
                    onTap: goToLiveAttendance
                )
                
                DashboardFeatureItemView(
                    imageName: "ic_time_off_request",
                    title: "Time-Off Request",
                    isLocked: true
                )
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.top, 11)
        }
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white.opacity(0.5))
                .stroke(Color.white.opacity(0.5), lineWidth: 1)
                .shadow(color: Color.primary500.opacity(0.3), radius: 8, x: 0, y: 4)
        )
        .padding(.horizontal, 10)
    }
}

#Preview {
    
    HomeSummaryCardView(greetingMessage: "Good Morning🌞", name: "Nabila", role: "CEO", imageProfile: Image("img_profile"), availableLeaveCount: "8", leaveUsedCount: "2") {
        
    }
    
}
