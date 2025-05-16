//
//  HomeView.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 14/05/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Image("Background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
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
                            
                        Text("Nongsa Digital Park")
                            .foregroundColor(.violet50)
                            .font(.system(size: 10))
                    }
                    .padding(.trailing, 15)
                }
                
                HomeSummaryCardView()
                
                SectionHeaderView(title: "List Time-Off Request", showMoreAction: {})
                    .padding(.top, 18)
                    .padding(.horizontal, 10)
                
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(0..<2, id: \.self) { _ in
                        TimeOffRequestCardView(
                            profileImage: Image("Profile"),
                            name: "Gabriela",
                            role: "CEO",
                            leaveStartDate: "24 Mar 2025",
                            leaveEndDate: "25 Mar 2025",
                            timeAgo: "5 minutes ago"
                        )
                    }
                }
                .padding(.horizontal, 10)
            }
        }
    }
}

#Preview {
    HomeView()
}
