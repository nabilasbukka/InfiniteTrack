//
//  LiveAttendanceView.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 19/05/25.
//

import SwiftUI

struct LiveAttendanceView: View {
    let timeNow: String
    let dateNow: String
    let buttonAction: () -> Void
    @Environment(\.presentationMode) var presentationMode
    @State private var selected: AttendanceType = .office
    @State private var checkInNote: String = ""
    enum AttendanceType {
        case office
        case home
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            HStack(spacing: 0) {
                Button(action: {
                    selected = .office
                }) {
                    HStack(spacing: 8) {
                        Image("ic_office")
                        Text("Work From Office")
                            .font(.system(size: 14, weight: .semibold))
                    }
                    .foregroundColor(selected == .office ? .white : .primary500)
                    .frame(width: 160, height: 40)
                    .background(
                        selected == .office ?
                        Color.primary500 : Color.clear
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                
                Button(action: {
                    selected = .home
                }) {
                    HStack(spacing: 8) {
                        Image("ic_home")
                        Text("Work From Home")
                            .font(.system(size: 14, weight: .semibold))
                    }
                    .foregroundColor(selected == .home ? .white : .primary500)
                    .frame(width: 160, height: 40)
                    .background(
                        selected == .home ?
                        Color.primary500 : Color.clear
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
            .padding(4)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.primary50, lineWidth: 1)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.white.opacity(0.2))
                    )
            )
            .frame(width: 327, height: 44)
            
            Text(timeNow)
                .font(.system(size: 32, weight: .medium))
                .foregroundColor(.dark500)
            
            Text(dateNow)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.dark300)
            
            ZStack {
                Rectangle()
                    .fill(Color.clear)
                    .frame(height: 127)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white, lineWidth: 2)
                    )
                
                VStack(alignment: .center, spacing: 8) {
                    Text("Daily Schedule")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.dark400)
                    
                    Text("09:00 - 17.00")
                        .font(.system(size: 24, weight: .medium))
                        .foregroundColor(.dark500)
                    
                    ZStack {
                        Rectangle()
                            .fill(Color.clear)
                            .frame(width: 303, height: 38)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                        
                        HStack {
                            HStack {
                                Image(systemName: "arrow.down.left.circle.fill")
                                    .foregroundColor(.primary500)
                                
                                Text("Check In")
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundColor(.primary400)
                            }
                            
                            HStack {
                                Image(systemName: "arrow.up.right.circle.fill")
                                    .foregroundColor(.dark300)
                                
                                Text("Check Out")
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundColor(.dark300)
                            }
                        }
                    }
                }
            }
            
            Text("Add Notes (Optional)")
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(.dark500)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 24)
                .padding(.horizontal, 4)
            
            ZStack(alignment: .topLeading) {
                if checkInNote.isEmpty {
                    Text("Write note")
                        .foregroundColor(.gray)
                        .padding(.vertical, 16)
                        .padding(.horizontal, 16)
                }
                
                TextEditor(text: $checkInNote)
                    .scrollContentBackground(.hidden)
                    .background(Color.clear)
                    .padding(12)
                    .frame(height: 125)
                    .frame(maxWidth: .infinity)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.white, lineWidth: 2)
                    )
                    .foregroundColor(.dark400)
                    .font(.system(size: 14))
            }
            
            Spacer()
            
            Button(action: buttonAction) {
                Text("Send")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.white)
                    .frame(width: 323, height: 50)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.primary500)
                    )
            }
        }
        .padding(12)
        
        .navigationTitle("Live Attendance")
        .navigationBarTitleDisplayMode(.inline)
//        .navigationBarBackButtonHidden(true)
//        .navigationBarHidden(true)
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
    LiveAttendanceView(timeNow: "09:00", dateNow: "Mon, 12 Mar 2024", buttonAction: {})
}
