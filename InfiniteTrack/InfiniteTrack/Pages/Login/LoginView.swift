//
//  LoginView.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 20/05/25.
//

import SwiftUI

struct LoginView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
    @ViewBuilder
    func bannerLoginView() -> some View {
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
    }
    
    @ViewBuilder
    func inputEmailPasswordView() -> some View {
        InputEmailField(email: $email)
        
        ConfirmPasswordField(password: $password)
    }
    
    @ViewBuilder
    func wrongPasswordMsgError() -> some View {
        HStack(spacing: 4) {
            Image(systemName: "exclamationmark.circle")
                .foregroundColor(.red)
            
            Text("Wrong password. Try again or click Forgot password to reset.")
                .foregroundColor(.red)
                .font(.system(size: 10))
                .fontWeight(.medium)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    @ViewBuilder
    func forgotPasswordBtn() -> some View {
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
    
    var body: some View {
        VStack(spacing: 12) {
            bannerLoginView()
            
            inputEmailPasswordView()
            
            wrongPasswordMsgError()
            
            forgotPasswordBtn()

        }
        .padding(16)
        .pageBackground()
    }
}

#Preview {
    LoginView()
}
