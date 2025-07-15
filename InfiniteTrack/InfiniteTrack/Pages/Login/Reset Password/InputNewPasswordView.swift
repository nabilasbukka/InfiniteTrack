//
//  InputNewPasswordView.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 22/05/25.
//

import SwiftUI

struct InputNewPasswordView: View {
    @EnvironmentObject var authRouter: AuthRouter
    @State var viewModel = InputNewPasswordViewModel()
    
    init(email: String) {
        viewModel.email = email
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
            
            Text("Account \(viewModel.email)")
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
            
            Spacer()
            
            PrimaryButton(title: "Save Password", action: {
                if !viewModel.isPasswordMismatch {
                    Task {
                        await viewModel.updateNewPassword(email: viewModel.email,
                                                    newPassword: viewModel.newPassword)
                        await navigateToLogin()
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
