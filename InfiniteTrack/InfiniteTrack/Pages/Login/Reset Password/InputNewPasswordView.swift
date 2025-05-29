//
//  InputNewPasswordView.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 22/05/25.
//

import SwiftUI

struct InputNewPasswordView: View {
    @State private var password: String = ""
    @State private var passwordConfirmation: String = ""
    
    var isPasswordMismatch: Bool {
        !passwordConfirmation.isEmpty && password != passwordConfirmation
    }
    
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
            
            Text("Account xxxx@gmail.com")
                .font(.system(size: 16))
                .foregroundColor(.dark300)
                .fontWeight(.regular)
            
            Text("Successfully Verified")
                .font(.system(size: 16))
                .foregroundColor(.primary500)
                .fontWeight(.medium)
            
            ConfirmPasswordField(password: $password)
            
            VStack(spacing: 4) {
                ConfirmPasswordField(password: $passwordConfirmation, placeholder: "Confirmation your Password")
                
                if isPasswordMismatch {
                    Text("Passwords do not match")
                        .font(.system(size: 12))
                        .foregroundColor(.red)
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 4)
                }
            }
            
            Spacer()
            
            PrimaryButton(title: "Save Password", action: {})
        }
        .padding(16)
        .pageBackground()
    }
}

#Preview {
    InputNewPasswordView()
}
