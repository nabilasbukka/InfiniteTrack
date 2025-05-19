//
//  AttendanceHistoryView.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 18/05/25.
//

import SwiftUI

struct AttendanceHistoryView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 16) {
            
            HStack {
                Text("Today, 11 August 2023")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.primary500)
                
                Spacer()
                
                Menu {
                    Button("Last Week") {
                        // action
                    }
                    Button("2 Weeks Ago") {
                        // action
                    }
                    Button("3 Weeks Ago") {
                        // action
                    }
                    Button("1 Month Ago") {
                        // action
                    }
                } label: {
                    Image(systemName: "arrow.up.arrow.down")
                        .foregroundColor(.primary500)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 10)
                }
                
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray.opacity(0.3), lineWidth: 2)
            )
            .padding(.horizontal, 8)
            .padding(.top, 20)
            
            ScrollView {
                VStack(spacing: 8) {
                    ForEach(0..<4, id: \.self) { _ in
                        AttendanceHistoryCardItemView(
                            date: "09",
                            monthYear: "July 2025",
                            checkInTime: "08:00",
                            checkOutTime: "09:00",
                            totalHours: "08:00"
                        )
                    }
                }
            }
            
            Spacer()
            
        }
        .navigationTitle("My Attendance")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(Color.primary500)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.purple, lineWidth: 1)
                        )
                }
            }
        }
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.white.opacity(0.6), Color.yellow.opacity(0.1)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
        )
        .pageBackground()
        
    }
}

#Preview {
    AttendanceHistoryView()
}

