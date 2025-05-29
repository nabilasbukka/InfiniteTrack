//
//  InputOTPView.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 22/05/25.
//

import SwiftUI

struct InputOTPView: View {
    @State private var otp: String = ""
    
    let boxCount = 4
    
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
                        .frame(width: 60, height: 60)
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
        
        HStack {
            Text("Didn't receive the code?")
                .font(.system(size: 14))
                .foregroundColor(.dark200)
                .fontWeight(.medium)
            
            Button("Resend") {
            }
            .font(.system(size: 12, weight: .medium))
            .foregroundColor(.primary500)
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
            
            PrimaryButton(title: "Confirm", action: {})
        }
        .padding(16)
        .pageBackground()
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                UIApplication.shared.sendAction(#selector(UIResponder.becomeFirstResponder), to: nil, from: nil, for: nil)
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

#Preview {
    InputOTPView()
}
