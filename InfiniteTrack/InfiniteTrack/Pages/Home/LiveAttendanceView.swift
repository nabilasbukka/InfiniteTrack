//
//  LiveAttendanceView.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 19/05/25.
//

import SwiftUI

struct LiveAttendanceView: View {
    let buttonAction: () -> Void
    @Environment(\.presentationMode) var presentationMode
    @State private var selected: AttendanceType = .office
    @State private var checkInNote: String = ""
    @StateObject private var viewModel = LiveAttendanceViewModel()
    enum AttendanceType {
        case office
        case home
    }
    
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
    }
    
    @ViewBuilder
    func segmentedView() -> some View {
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
                .frame(width: 180, height: 44)
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
                .frame(width: 180, height: 44)
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
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 8) {
                segmentedView()
                
                Text(viewModel.currentTime)
                    .font(.system(size: 32, weight: .medium))
                    .foregroundColor(.dark500)
                
                Text(viewModel.currentDate)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.dark300)
                
                scheduleSectionView()
                
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
                
                if selected == .home {
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
                
                Spacer()
                
                PrimaryButton(title: "Send", action: buttonAction)
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
    }
    
}

#Preview {
    LiveAttendanceView(buttonAction: {})
}
