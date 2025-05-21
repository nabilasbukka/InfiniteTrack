//
//  AttendanceHistoryCardItemView.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 16/05/25.
//

import SwiftUI

struct AttendanceHistoryCardItemView: View {
    var date: String
    var monthYear: String
    var checkInTime: String
    var checkOutTime: String
    var totalHours: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            HStack {
                Text(date)
                    .font(.system(size: 24, weight: .medium))
                    .foregroundColor(.primary50)
                
                Text(monthYear)
                    .font(.system(size: 8, weight: .medium))
                    .foregroundColor(.primary50)
            }
            .padding(8)
            .background(Color.primary500)
            .cornerRadius(8)
            
            HStack {
                VStack {
                    Text(checkInTime)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.dark500)
                    
                    Text("Check In")
                        .font(.system(size: 8, weight: .thin))
                        .foregroundColor(.dark300)
                }
                
                Spacer()
                
                Rectangle()
                    .frame(width: 0.5, height: 23)
                    .background(Color.dark200)
                
                Spacer()
                
                VStack {
                    Text(checkOutTime)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.dark500)
                    
                    Text("Check Out")
                        .font(.system(size: 8, weight: .thin))
                        .foregroundColor(.dark300)
                }
                
                Spacer()
                
                Rectangle()
                    .frame(width: 0.5, height: 23)
                    .background(Color.dark200)
                
                Spacer()
                
                VStack {
                    Text(totalHours)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.dark500)
                    
                    Text("Total Hours")
                        .font(.system(size: 8, weight: .thin))
                        .foregroundColor(.dark300)
                }
            }
            .padding(.horizontal, 20)
        }
        .padding(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.white, lineWidth: 1)
        )
        .padding(.horizontal, 8)
    }
}

#Preview {
    AttendanceHistoryCardItemView(date: "09", monthYear: "May 2025", checkInTime: "08:00", checkOutTime: "17:00", totalHours: "08:00")
}
