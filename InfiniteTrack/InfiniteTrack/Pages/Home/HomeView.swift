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
    
    @ViewBuilder
    func navigationView() -> some View {
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
                        .font(.system(size: 12))
                }
            }
            .padding(.trailing, 15)
        }
    }
    
    @ViewBuilder
    func rankAttendanceEmployeeView() -> some View {
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
    }
    
    @ViewBuilder
    func attendanceHistoryEmployeeView() -> some View {
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
    
    @ViewBuilder
    func homeSummaryCardInternView() -> some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Halo,")
                        .foregroundColor(.dark400)
                        .font(.system(size: 14))
                    Text("Raja Muhammad Farhan Zahputra")
                        .foregroundColor(.dark500)
                        .font(.system(size: 20))
                    Text("Android Developer Intern")
                        .foregroundColor(.dark300)
                        .font(.system(size: 12))
                }

                Spacer()

                Image("img_profile")
                    .resizable()
                    .frame(width: 34, height: 34)
                    .clipShape(Circle())
            }
            .padding(.horizontal, 16)
            
            VStack(spacing: 16) {
                HStack(spacing: 16) {
                    AttendanceInfoItemView()
                    AttendanceInfoItemView()
                }
                HStack(spacing: 16) {
                    AttendanceInfoItemView()
                    AttendanceInfoItemView()
                }
            }
            .padding(.horizontal, 16)
        }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    navigationView()
                    
                    HomeSummaryCardView(
                        greetingMessage: "Halo,",
                        name: "Nabila Putri Syafrina Bukka",
                        role: "Web Technical Mentor",
                        imageProfile: Image("img_profile"),
                        availableLeaveCount: "8",
                        leaveUsedCount: "2") {
                            goToLiveAttendance = true
                        }
                    
//                    homeSummaryCardInternView()
                    
                    rankAttendanceEmployeeView()
                    
                    attendanceHistoryEmployeeView()
                }
            }
            .onChange(of: showAttendanceHistory) {
                if showAttendanceHistory {
                    navState.presentFullScreen(view: AnyView(AttendanceHistoryView()))
                    showAttendanceHistory = false
                }
            }
            
            .fullScreenCover(isPresented: $goToLiveAttendance, content: {
                NavigationStack {
                    LiveAttendanceView(buttonAction: {})
                }
            })
            .pageBackground()
        }
    }
}

#Preview {
    HomeView()
}
