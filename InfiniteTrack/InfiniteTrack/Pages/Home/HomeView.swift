//
//  HomeView.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 14/05/25.
//

import SwiftUI

struct HomeView: View {
    @State private var showAttendanceHistory = false
    @State private var goToLiveAttendance = false
    @EnvironmentObject var navState: NavigationState
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    HStack {
                        Text("Monday, 09 September 2024")
                            .foregroundColor(.dark500)
                            .font(.system(size: 12))
                            .padding(.leading, 15)
                        
                        Spacer()
                        
                        ZStack {
                            Rectangle()
                                .fill(Color.primary500)
                                .frame(width: 144, height: 20)
                                .cornerRadius(10)
                            HStack {
                                Image(.icPinLocation)
                                
                                Text("Nongsa Digital Park")
                                    .foregroundColor(.violet50)
                                    .font(.system(size: 10))
                            }
                        }
                        .padding(.trailing, 15)
                    }
                    
                    HomeSummaryCardView(
                        greetingMessage: "Good Morning🌞",
                        name: "Nabila Putri Syafrina Bukka",
                        role: "Web Technical Mentor",
                        imageProfile: Image("img_profile"),
                        availableLeaveCount: "8",
                        leaveUsedCount: "2") {
                            goToLiveAttendance = true
                        }
                    
                    HStack {
                        Text("Top 3 Early Birds")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.dark500)
                        
                        Spacer()
                    }
                    .padding(8)
                    
                    ForEach(1...3, id: \.self) { rank in
                        AttendanceRankCardView(
                            rank: "\(rank)",
                            profileImage: Image("img_profile"),
                            name: "Nabila",
                            checkinTime: "08:00",
                            timeAgo: "5 minutes ago"
                        )
                        .padding(.horizontal,8)
                    }
                    
                    HStack {
                        Text("Top 3 Late Check-ins")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.dark500)
                        
                        Spacer()
                    }
                    .padding(8)
                    
                    ForEach(1...3, id: \.self) { rank in
                        AttendanceRankCardView(
                            rank: "\(rank)",
                            profileImage: Image("img_profile"),
                            name: "Nabila",
                            checkinTime: "08:00",
                            timeAgo: "5 minutes ago"
                        )
                        .padding(.horizontal,8)
                    }
                    
                    SectionHeaderView(
                        title: "Attandance History",
                        showMoreAction: {
                            showAttendanceHistory = true
                        }
                    )
                    .padding(.top, 18)
                    .padding(.horizontal, 10)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(0..<5, id: \.self) { _ in
                            AttendanceHistoryCardItemView(
                                date: "09",
                                monthYear: "May 2025",
                                checkInTime: "08:00",
                                checkOutTime: "17:00",
                                totalHours: "08:00"
                            )
                        }
                    }
                }
            }
            .onChange(of: showAttendanceHistory) {
                if showAttendanceHistory {
                    navState.presentFullScreen(view: AnyView(AttendanceHistoryView()))
                    showAttendanceHistory = false
                }
            }
            .onChange(of: goToLiveAttendance) {
                if goToLiveAttendance {
                    navState.presentFullScreen(
                        view: AnyView(
                            LiveAttendanceView(
                                timeNow: "09:00",
                                dateNow: "Mon, 12 May 2024",
                                buttonAction: {}
                            )
                        )
                    )
                    goToLiveAttendance = false
                }
            }
            .pageBackground()
        }
    }
}

#Preview {
    HomeView()
}
