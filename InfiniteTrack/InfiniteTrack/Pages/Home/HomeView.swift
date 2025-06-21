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
    @StateObject private var viewModel = HomeViewModel()
    @EnvironmentObject var navState: NavigationState
    
    @ViewBuilder
    func navigationView() -> some View {
        HStack {
            Text(viewModel.currentDate)
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
                    
                    Text(viewModel.locationName)
                        .foregroundColor(.violet50)
                        .font(.system(size: 12))
                        .lineLimit(1)
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
    func attendanceHistoryView() -> some View {
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
    
    @ViewBuilder
    func summaryAttendanceToday() -> some View {
        VStack(alignment: .center, spacing: 16) {
            Text(Date().toString(format: "EEEE, dd MMM yyyy"))
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(.dark500)

            if let attendance = viewModel.todayAttendance {
                HStack(spacing: 26) {
                    AttendanceSummaryItem(title: "Check-in", time: attendance.checkInTime)
                    AttendanceSummaryItem(title: "Check-out", time: attendance.checkOutTime)
                    AttendanceSummaryItem(title: "Total Hours", time: attendance.totalHours)
                }
            } else {
                Text("Belum ada data absensi hari ini.")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white.opacity(0.5))
                .shadow(color: Color.primary500.opacity(0.3), radius: 8, x: 0, y: 4)
        )
        .padding(.horizontal, 10)
        .padding(.top, 10)
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    navigationView()
                    if let userDetail = viewModel.userDetail {
                        HomeSummaryCardView(
                            greetingMessage: userDetail.greeting ?? "Halo,",
                            name: userDetail.userName ?? "-",
                            role: userDetail.positionName ?? "-",
                            imageProfile: Image("img_profile"),
                            availableLeaveCount: "8",
                            leaveUsedCount: "2") {
                                goToLiveAttendance = true
                            }
                    }
                    
                    summaryAttendanceToday()
                    
                    //                    homeSummaryCardInternView()
                    
                    rankAttendanceEmployeeView()
                    //
                    //                    attendanceHistoryView()
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
                    LiveAttendanceView()
                }
            })
            .pageBackground()
            .onAppear {
                viewModel.onAppear()
            }
        }
    }
}
