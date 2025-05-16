//
//  TabBarView.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 14/05/25.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house.fill") {
                HomeView()
            }
            
            Tab("Contact", systemImage: "phone.fill") {
                EmptyView()
            }
            
            Tab("Check In", systemImage: "checkmark.circle.fill") {
                EmptyView()
            }
            
            Tab("My Leaves", systemImage: "bag.fill") {
                EmptyView()
            }
            
            Tab("Profile", systemImage: "person.fill") {
                ProfileView()
            }
        }
    }
}

#Preview {
    TabBarView()
}
