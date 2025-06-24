//
//  ProfileView.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 14/05/25.
//

import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()
    @EnvironmentObject var loginState: LoginState
    
    @ViewBuilder
    func profileHeader() -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text("Nabila Syafrina")
                    .foregroundColor(.dark500)
                    .font(.system(size: 24) .weight(.medium))
                
                Text("Technical Web Mentor")
                    .foregroundColor(.dark500)
                    .font(.system(size: 14) .weight(.medium))
            }
            
            Spacer()
            
            Image("img_profile")
                .resizable()
                .frame(width: 74, height: 74)
                .clipShape(Circle())
        }
    }
    
    @ViewBuilder
    func accountInformation() -> some View {
        VStack(alignment: .leading, spacing: 32) {
            Text("Account Information")
                .foregroundColor(.dark500)
                .font(.system(.body) .weight(.semibold))
            
            HStack {
                Image(systemName: "info.circle")
                    .foregroundColor(.dark500)
                
                Text("Detail Account")
                    .foregroundColor(.dark500)
                    .font(.system(.body) .weight(.regular))
                
                Spacer()
                
                Image(systemName: "chevron.right")
            }
            
            HStack {
                Image(systemName: "iphone.and.arrow.right.inward")
                    .foregroundColor(.red)
                
                Text("Logout")
                    .foregroundColor(.red)
                    .font(.system(.body) .weight(.regular))
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.red)
            }
            .background(Rectangle().fill(.clear))
            .onTapGesture {
                viewModel.onClickLogout()
                loginState.isLoggedIn = false
            }
            
//            HStack {
//                Image(systemName: "dollarsign.circle")
//                    .foregroundColor(.dark500)
//                
//                Text("Pay Slip")
//                    .foregroundColor(.dark500)
//                    .font(.system(.body) .weight(.regular))
//                
//                Spacer()
//                
//                Image(systemName: "chevron.right")
//            }
//            
//            HStack {
//                Image(systemName: "text.document")
//                    .foregroundColor(.dark500)
//                
//                Text("My Document")
//                    .foregroundColor(.dark500)
//                    .font(.system(.body) .weight(.regular))
//                
//                Spacer()
//                
//                Image(systemName: "chevron.right")
//            }
        }
    }
    
    @ViewBuilder
    func profileSettings() -> some View {
        VStack(alignment: .leading, spacing: 32) {
            Text("Settings")
                .foregroundColor(.dark500)
                .font(.system(.body) .weight(.semibold))
            
            HStack {
                Image(systemName: "globe")
                    .foregroundColor(.dark500)
                
                Text("Language")
                    .foregroundColor(.dark500)
                    .font(.system(.body) .weight(.regular))
                
                Spacer()
                
                Text("English")
                    .foregroundColor(.dark500)
                    .font(.system(.body) .weight(.regular))
                
                Image(systemName: "chevron.right")
            }
            
            HStack {
                Image(systemName: "headphones")
                    .foregroundColor(.dark500)
                
                Text("Contact Us")
                    .foregroundColor(.dark500)
                    .font(.system(.body) .weight(.regular))
                
                Spacer()
                
                Image(systemName: "chevron.right")
            }
            
            HStack {
                Image(systemName: "questionmark.circle")
                    .foregroundColor(.dark500)
                
                Text("FAQ")
                    .foregroundColor(.dark500)
                    .font(.system(.body) .weight(.regular))
                
                Spacer()
                
                Image(systemName: "chevron.right")
            }
            
            HStack {
                Image(systemName: "person.3")
                    .foregroundColor(.dark500)
                
                Text("About Us")
                    .foregroundColor(.dark500)
                    .font(.system(.body) .weight(.regular))
                
                Spacer()
                
                Image(systemName: "chevron.right")
            }
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                profileHeader()
                
                accountInformation()
            }
            .padding(28)
        }
        .pageBackground()
    }
}

#Preview {
    ProfileView()
}
