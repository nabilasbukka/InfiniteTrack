//
//  AttendanceHistoryView.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 18/05/25.
//

import SwiftUI

struct AttendanceHistoryView: View {
    @StateObject private var viewModel = AttendanceHistoryViewModel()
    @State private var selectedStartDate: Date = Date()
    @State private var selectedEndDate: Date = Date()
    @State private var isRange: Bool = false
    @State private var showDatePicker = false
    
    var body: some View {
        VStack(spacing: 8) {
            FilterAttendanceDateView(startDate: viewModel.startDate, minStartDate: viewModel.minStartDate) { newStartDate, newEndDate in
                viewModel.startDate = newStartDate
                viewModel.endDate = newEndDate
                viewModel.onClickSearch()
            }
            .shadow(radius: 4)
            .padding()
            
            ScrollView {
                VStack(spacing: 8) {
                    if viewModel.isLoading {
                        ProgressView()
                    } else if let error = viewModel.errorMessage {
                        Text("Error: \(error)").foregroundColor(.red)
                    } else {
                        ForEach(viewModel.displayedItems) { item in
                            AttendanceHistoryCardItemView(
                                date: item.textDate,
                                monthYear: item.textMonthYear,
                                checkInTime: item.checkInTime,
                                checkOutTime: item.checkOutTime,
                                totalHours: item.totalHours
                            )
                        }
                    }
                }
                //                            .padding()
            }
            
            Spacer()
            
        }
        .navigationTitle("My Attendance")
        .navigationBarTitleDisplayMode(.inline)
        .customBackButton()
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.white.opacity(0.6), Color.yellow.opacity(0.1)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
        )
        .pageBackground()
        .onAppear {
            viewModel.onAppear()
        }
        
    }
}

#Preview {
    AttendanceHistoryView()
}

