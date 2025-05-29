//
//  InputEmailView.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 21/05/25.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State private var email = ""
    
    @ViewBuilder
    func inputNewEmailView() -> some View {
        Text("Enter the Email Address connected to perform the recovery")
            .font(.system(size: 15))
            .foregroundColor(.dark500)
            .fontWeight(.medium)
        
        InputEmailField(email: $email)
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
            
            PrimaryButton(title: "Next", action: {})
            
        }
        .padding(16)
        .pageBackground()
    }
}

#Preview {
    ForgotPasswordView()
}
