//
//  LoginView.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 20/05/25.
//

import SwiftUI

struct LoginView: View {
    @State private var name: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack(spacing: 12) {
            Image("img_login")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: 300)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Hello Again!")
                    .foregroundColor(.dark500)
                    .font(.system(size: 28))
                    .fontWeight(.medium)

                Text("Sign in your account now and start exploring")
                    .foregroundColor(.dark400)
                    .font(.system(size: 16))
                    .fontWeight(.medium)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 8)
            
            TextField("Enter your Email", text: $name)
                       .padding()
                       .background(Color.dark100.opacity(0.2))
                       .cornerRadius(8)
                       .overlay(
                           RoundedRectangle(cornerRadius: 8)
                               .stroke(Color.white.opacity(0.5), lineWidth: 1)
                       )
            
            TextField("Enter your Password", text: $password)
                       .padding()
                       .background(Color.dark100.opacity(0.2))
                       .cornerRadius(8)
                       .overlay(
                           RoundedRectangle(cornerRadius: 8)
                               .stroke(Color.white.opacity(0.5), lineWidth: 1)
                       )
            
            Button("Forgot Password?") {
                // Action here
            }
            .font(.system(size: 12, weight: .medium))
            .foregroundColor(.dark500)
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.top, 4)
            
            PrimaryButton(title: "Sign In", action: {})
                .padding(.top, 16)
            
            Spacer()

        }
        .padding(16)
        .pageBackground()
    }
}

#Preview {
    LoginView()
}
