//
//  InputOTPView.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 22/05/25.
//

import SwiftUI

struct InputOTPView: View {
    @EnvironmentObject var authRouter: AuthRouter
    @State var viewModel = InputOTPViewModel()
    @State private var otp: String = ""
    @State private var resendCooldown: Int = 0
    let boxCount = 6
    
    
    init(otpData: EmailOTPUIModel, email: String) {
        viewModel.data = otpData
        viewModel.email = email
    }
    
    @ViewBuilder
    func inputOTPView() -> some View {
        Text("Enter OTP for recovery verification")
            .font(.system(size: 15))
            .foregroundColor(.dark500)
            .fontWeight(.medium)
        
        HStack(spacing: 16) {
            ForEach(0..<boxCount, id: \.self) { index in
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.primary400.opacity(0.5), lineWidth: 2)
                        .frame(width: .infinity, height: 60)
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(10)
                    
                    Text(self.getCharacter(at: index))
                        .font(.system(size: 24, weight: .medium))
                        .foregroundColor(.dark300)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .overlay(
            OTPTextFieldRepresentable(text: $otp) { newText in
                otp = String(newText.prefix(boxCount))
            }
            .frame(width: 1, height: 1) //
        )
        .contentShape(Rectangle())
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.becomeFirstResponder), to: nil, from: nil, for: nil)
        }
        
        HStack(spacing: 4) {
            Text("Didn't receive the code?")
                .font(.system(size: 14))
                .foregroundColor(.dark200)
                .fontWeight(.medium)
            
            Button("Resend") {
                Task {
                    await viewModel.resendEmailOTP()
                    resendCooldown = 30
                }
            }
            .disabled(resendCooldown > 0)
            .font(.system(size: 12, weight: .medium))
            .foregroundColor(resendCooldown > 0 ? .gray : .primary500)
            
            if resendCooldown > 0 {
                Text("in \(resendCooldown)s")
                    .font(.system(size: 12))
                    .foregroundColor(.dark200)
            }
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ZStack {
                Rectangle()
                    .fill(Color.clear)
                    .frame(maxWidth: .infinity, maxHeight: 200)
                
                Image("img_input_otp")
                    .resizable()
                    .frame(width: 200, height: 200)
            }
            
            inputOTPView()
            
            Spacer()
            
            PrimaryButton(title: "Confirm", action: {
                Task {
                    await viewModel.verifyOTP(otp: otp)
                    
                    if viewModel.isOTPVerified {
                        if let email = viewModel.email {
                            authRouter.navigate(to: .updateNewPassword(email: email))
                        } else {
                            print("EMAIIL NOT FOUND")
                        }
                    } else {
                        print("OTP NOT MATCH")
                    }
                }
                
//                if otp == viewModel.data?.otp ?? "" {
//                    
//                    
//                } else {
//                    
//                }
                
            })
        }
        .padding(16)
        .pageBackground()
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                UIApplication.shared.sendAction(#selector(UIResponder.becomeFirstResponder), to: nil, from: nil, for: nil)
            }
        }
        .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect()) { _ in
            if resendCooldown > 0 {
                resendCooldown -= 1
            }
        }

    }
    
    private func getCharacter(at index: Int) -> String {
        if index < otp.count {
            let charIndex = otp.index(otp.startIndex, offsetBy: index)
            return String(otp[charIndex])
        }
        return ""
    }
}

//#Preview {
//    InputOTPView(otpData: EmailOTPUIModel()
//}
