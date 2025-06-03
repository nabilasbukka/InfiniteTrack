//
//  LiveAttendanceView.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 19/05/25.
//

import SwiftUI

enum AttendanceType: String, Codable {
    case office = "Work From Office"
    case home = "Work From Home"
}

enum AttendanceAction: String {
    case checkIn = "checkin"
    case checkOut = "checkout"
}

struct LiveAttendanceView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModel = LiveAttendanceViewModel()
    
    @ViewBuilder
    func scheduleSectionView() -> some View {
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
                                .foregroundColor(viewModel.attendanceAction == .checkIn ? .primary500 : .dark300)
                            
                            Text("Check In")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(viewModel.attendanceAction == .checkIn ? .primary500 : .dark300)
                        }
                        
                        HStack {
                            Image(systemName: "arrow.up.right.circle.fill")
                                .foregroundColor(viewModel.attendanceAction == .checkOut ? .primary500 : .dark300)
                            
                            Text("Check Out")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(viewModel.attendanceAction == .checkOut ? .primary500 : .dark300)
                        }
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    func segmentedView() -> some View {
        HStack(spacing: 0) {
            Button(action: {
                viewModel.attendanceType = .office
            }) {
                HStack(spacing: 8) {
                    Image("ic_office")
                    Text("Work From Office")
                        .font(.system(size: 14, weight: .semibold))
                }
                .foregroundColor(viewModel.attendanceType == .office ? .white : .primary500)
                .frame(width: 180, height: 44)
                .background(
                    viewModel.attendanceType == .office ?
                    Color.primary500 : Color.clear
                )
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            
            Button(action: {
                viewModel.attendanceType = .home
            }) {
                HStack(spacing: 8) {
                    Image("ic_home")
                    Text("Work From Home")
                        .font(.system(size: 14, weight: .semibold))
                }
                .foregroundColor(viewModel.attendanceType == .home ? .white : .primary500)
                .frame(width: 180, height: 44)
                .background(
                    viewModel.attendanceType == .home ?
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
    }
    
    @ViewBuilder
    func addNotesView() -> some View {
        Text("Add Notes (Optional)")
            .font(.system(size: 12, weight: .medium))
            .foregroundColor(.dark500)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 24)
            .padding(.horizontal, 4)
        
        ZStack(alignment: .topLeading) {
            if viewModel.notes.isEmpty {
                Text("Write note")
                    .foregroundColor(.gray)
                    .padding(.vertical, 16)
                    .padding(.horizontal, 16)
            }
            
            TextEditor(text: $viewModel.notes)
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
    }
    
    @ViewBuilder
    func uploadImageView() -> some View {
        if viewModel.attendanceType == .home {
            Text("Upload Image")
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(.dark500)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 24)
                .padding(.horizontal, 4)
            
            Button(action: {
                viewModel.openCamera()
            }) {
                ZStack {
                    VStack(spacing: 8) {
                        Image(systemName: "camera")
                            .resizable()
                            .frame(width: 49, height: 39)
                            .foregroundColor(.primary500)
                        
                        Text("Tap to add your photo")
                            .font(.system(size: 20, weight: .medium))
                            .foregroundColor(.dark500)
                        
                        Text("Make sure your photo is clearly shows your face!")
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(.dark300)
                    }
                    .padding()
                }
            }
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.primary50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white, lineWidth: 2)
                    )
            )
            .onTapGesture {
                print("Camera view tapped")
            }
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 16) {
                segmentedView()
                
                Text(viewModel.currentTime)
                    .font(.system(size: 32, weight: .medium))
                    .foregroundColor(.dark500)
                
                Text(viewModel.currentDate)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.dark300)
                
                scheduleSectionView()
                
                addNotesView()
                
                uploadImageView()
                
                Spacer()
                
                PrimaryButton(title: "Send", action: {
                    viewModel.submitAttendance()
                })
            }
            .padding(12)
        }
        .navigationTitle("Live Attendance")
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
    LiveAttendanceView()
}
