//
//  InputEmailView.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 21/05/25.
//

import SwiftUI

struct ForgotPasswordView: View {
    @EnvironmentObject var authRouter: AuthRouter
    @State var viewModel = ForgotPasswordViewModel()
    
    @ViewBuilder
    func inputNewEmailView() -> some View {
        Text("Enter the Email Address connected to perform the recovery")
            .font(.system(size: 15))
            .foregroundColor(.dark500)
            .fontWeight(.medium)
        
        InputEmailField(email: $viewModel.email)
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
            
            Spacer()
            
            PrimaryButton(title: "Next", action: {
                Task {
                    await viewModel.sendEmailOTP(email: viewModel.email)
                    await navigateToOTPVerification()
                }
            })
            
        }
        .padding(16)
        .pageBackground()
        .alert(viewModel.errorMessage, isPresented: $viewModel.isAlertErrorPresented) {
            Button("OK", role: .cancel) {
                
            }
        }
    }
    
    func navigateToOTPVerification() async {
        if let otpData = viewModel.otpData {
            authRouter.navigate(to: .veryfyEmailOTP(data: otpData, email: viewModel.email))
        } else {
            
        }
    }
}

#Preview {
    ForgotPasswordView()
}
