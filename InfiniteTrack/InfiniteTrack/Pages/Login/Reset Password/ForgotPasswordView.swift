//
//  InputEmailView.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 21/05/25.
//

import SwiftUI

struct ForgotPasswordView: View {
    @EnvironmentObject var authRouter: AuthRouter
    @StateObject var viewModel = ForgotPasswordViewModel()
    
    @ViewBuilder
    func inputNewEmailView() -> some View {
        Text("Enter the Email Address connected to perform the recovery")
            .font(.system(size: 15))
            .foregroundColor(.dark500)
            .fontWeight(.medium)
        
        InputEmailField(email: $viewModel.email)
    }
    
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
            
            inputNewEmailView()
            
            if viewModel.errorMessage.isNotEmpty {
                errorMessage(message: viewModel.errorMessage)
            }
            
            Spacer()
            
            PrimaryButton(title: "Next", isLoading: $viewModel.isLoading, action: {
                Task {
                    let success = await viewModel.sendEmailOTP(email: viewModel.email)
                    if success {
                        await navigateToOTPVerification()
                    }
                }
            })
        }
        .padding(16)
        .pageBackground()
    }
    
    func navigateToOTPVerification() async {
        
        if let otpData = viewModel.otpData {
            authRouter.navigate(to: .veryfyEmailOTP(data: otpData, email: viewModel.email))
        }
    }
}

#Preview {
    ForgotPasswordView()
}
