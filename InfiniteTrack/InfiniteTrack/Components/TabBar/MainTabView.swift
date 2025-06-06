//
//  MainTabView.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 14/05/25.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            NavigationStack {
                HomeView()
            }
            .tabItem {
                Label("Home", systemImage: "house.fill")
            }
            
            EmptyView()
                .tabItem {
                    Label("Contact", systemImage: "phone.fill")
                }
            
            EmptyView()
                .tabItem {
                    Label("Check In", systemImage: "checkmark.circle.fill")
                }
            
            AttendanceHistoryView()
                .tabItem {
                    Label("My Attendance", systemImage: "document.badge.clock")
                }
            
            NavigationStack {
                ProfileView()
            }
            .tabItem {
                Label("Profile", systemImage: "person.fill")
            }
        }
    }
}

#Preview {
    MainTabView()
}
