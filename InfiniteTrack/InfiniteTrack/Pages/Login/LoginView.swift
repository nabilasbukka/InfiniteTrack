//
//  LoginView.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 20/05/25.
//

import SwiftUI

struct LoginView: View {
    @Binding var isLoginSuccess: Bool
    @ObservedObject var viewModel: LoginViewModel = .init()
    
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
        InputEmailField(email: $viewModel.email)
        
        ConfirmPasswordField(password: $viewModel.password)
    }
    
    @ViewBuilder
    func wrongPasswordMsgError(message: String = "Wrong password. Try again or click Forget password to reset.") -> some View {
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
    
    @ViewBuilder
    func forgotPasswordBtn() -> some View {
        Button("Forgot Password?") {
            // Action here
        }
        .font(.system(size: 12, weight: .medium))
        .foregroundColor(.dark500)
        .frame(maxWidth: .infinity, alignment: .trailing)
        .padding(.top, 4)
        
        PrimaryButton(title: "Sign In", action: {
            viewModel.onClickLogin()
        })
            .disabled(!viewModel.isButtonLoginEnabled)
            .padding(.top, 16)
        
        Spacer()
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                bannerLoginView()
                
                inputEmailPasswordView()
                
                if viewModel.errorMessage.isNotEmpty {
                    wrongPasswordMsgError(message: viewModel.errorMessage)
                }
                
                forgotPasswordBtn()

            }
        }
        .padding(16)
        .pageBackground()
        .onTapGesture {
                UIApplication.shared.endEditing()
            }
        .onChange(of: viewModel.isLoginSuccess) {
            isLoginSuccess = viewModel.isLoginSuccess
        }
    }
}

#Preview {
    @Previewable @State var isLoginSuccess: Bool = false
    LoginView(isLoginSuccess: $isLoginSuccess)
}
