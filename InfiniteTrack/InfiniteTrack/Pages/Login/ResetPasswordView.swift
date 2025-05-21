//
//  ResetPasswordView.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 21/05/25.
//

import SwiftUI

struct ResetPasswordView: View {
    @State private var email = ""
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ZStack {
                Rectangle()
                    .fill(Color.clear)
                    .frame(maxWidth: .infinity, maxHeight: 200)
                
                Image("img_reset_password")
                        .resizable()
                        .frame(width: 200, height: 200)
            }
            
            Text("Enter the Email Address connected to perform the recovery")
                .font(.system(size: 15))
                .foregroundColor(.dark500)
                .fontWeight(.medium)
            
            TextField("Enter your email", text: $email)
                       .padding()
                       .background(Color.dark100.opacity(0.2))
                       .cornerRadius(8)
                       .overlay(
                           RoundedRectangle(cornerRadius: 8)
                               .stroke(Color.white.opacity(0.5), lineWidth: 1)
                       )
            
            Spacer()
            
            PrimaryButton(title: "Next", action: {})
            
        }
        .padding(16)
        .pageBackground()
    }
}

#Preview {
    ResetPasswordView()
}
