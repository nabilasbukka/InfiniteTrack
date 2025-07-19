//
//  InputNewPasswordView.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 22/05/25.
//

import SwiftUI

struct InputNewPasswordView: View {
    @EnvironmentObject var authRouter: AuthRouter
    @StateObject var viewModel = InputNewPasswordViewModel()
    
    var email: String
    
    @ViewBuilder
    func errorMessage(message: String = "Oopss... Something went wrong!") -> some View {
        HStack(spacing: 4) {
            Image(systemName: "exclamationmark.circle")
                .foregroundColor(.red)
            
            Text(message)
                .foregroundColor(.red)
                .font(.system(size: 10))
                .fontWeight(.medium)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
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
            
            Text("Account \(email)")
                .font(.system(size: 16))
                .foregroundColor(.dark300)
                .fontWeight(.regular)
            
            Text("Successfully Verified")
                .font(.system(size: 16))
                .foregroundColor(.primary500)
                .fontWeight(.medium)
            
            ConfirmPasswordField(password: $viewModel.newPassword)
            
            VStack(spacing: 4) {
                ConfirmPasswordField(password: $viewModel.confirmNewPassword, placeholder: "Confirmation your Password")
                
                if viewModel.isPasswordMismatch {
                    Text("Passwords do not match")
                        .font(.system(size: 12))
                        .foregroundColor(.red)
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 4)
                }
            }
            
            if viewModel.errorMessage.isNotEmpty {
                errorMessage(message: viewModel.errorMessage)
            }
            
            Spacer()
            
            PrimaryButton(title: "Save Password", isLoading: $viewModel.isLoading, action: {
                if !viewModel.isPasswordMismatch {
                    Task {
                        let success = await viewModel.updateNewPassword(email: email, newPassword: viewModel.newPassword)
                        
                        if success {
                            await navigateToLogin()
                        }
                        
                    }
                }
            })
        }
        .padding(16)
        .pageBackground()
    }
    
    func navigateToLogin() async {
        authRouter.reset()
    }
}

#Preview {
    InputNewPasswordView(email: "nabssyaf@gmail.com")
}
