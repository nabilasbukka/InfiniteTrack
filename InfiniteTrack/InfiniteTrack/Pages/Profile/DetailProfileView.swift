//
//  DetailProfileView.swift
//  InfiniteTrack
//
//  Created by Rizal Hilman on 13/07/25.
//

import SwiftUI

struct DetailProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()
    @EnvironmentObject var loginState: LoginState
    
    @ViewBuilder
    func profileHeader() -> some View {
        VStack {
            if let photoProfile = viewModel.userDetail?.profilePhoto {
                AsyncImage(url: URL(string: photoProfile)){ result in
                        result.image?
                            .resizable()
                            .scaledToFit()
                    }
                    .clipShape(Circle())
                    .frame(width: 74, height: 74)
            } else {
                Image("img_profile")
                    .resizable()
                    .frame(width: 74, height: 74)
                    .clipShape(Circle())
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Nabila Syafrina")
                    .foregroundColor(.dark500)
                    .font(.system(size: 24) .weight(.medium))
                
                Text("Technical Web Mentor")
                    .foregroundColor(.dark500)
                    .font(.system(size: 14) .weight(.medium))
            }
        }
    }
    
    @ViewBuilder
    func accountInfo(title: String, content: String) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(content)
                .font(.system(size: 14))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .overlay(alignment: .topLeading, content: {
            Text(title)
                .font(.callout)
                .foregroundColor(.gray)
                .offset(x: -10, y: -35)
        })
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white.opacity(0.5))
                .shadow(color: Color.primary500.opacity(0.3), radius: 8, x: 0, y: 4)
        )
        .padding(.top, 10)
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
                
                accountInfo(title: "Full Name",
                            content: viewModel.userDetail?.userName ?? "-")
                
                accountInfo(title: "NIP / NIM",
                            content: viewModel.userDetail?.nip_nim ?? "-")
                
                accountInfo(title: "Division",
                            content: viewModel.userDetail?.division ?? "-")
                
                
                accountInfo(title: "Position",
                            content: viewModel.userDetail?.positionName ?? "-")
                
                
                HStack {
                    accountInfo(title: "Start Contract",
                                content: viewModel.userDetail?.start_contract ?? "-")
                    
                    accountInfo(title: "End Contract",
                                content: viewModel.userDetail?.end_contract ?? "-")
                }
                
                accountInfo(title: "Email",
                            content: viewModel.userDetail?.email ?? "-")
                
                
                accountInfo(title: "Phone Number",
                            content: viewModel.userDetail?.phone_number ?? "-")
                
                
                accountInfo(title: "Address",
                            content: viewModel.userDetail?.address ?? "-")
                
            }
            .padding(28)
        }
        .pageBackground()
    }
}

#Preview {
    DetailProfileView()
}
