//
//  ConfirmPasswordField.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 26/05/25.
//

import SwiftUI

struct ConfirmPasswordField: View {
    @Binding var password: String
    @State private var isSecure: Bool = true
    
    var placeholder: String = "Enter your Password"
    
    var body: some View {
        HStack {
            
            Image(systemName: "lock.fill")
                .foregroundColor(.dark200)
            
            Group {
                if isSecure {
                    SecureField(placeholder, text: $password)
                } else {
                    TextField(placeholder, text: $password)
                }
            }
            .font(.system(size: 14, weight: .medium))
            .foregroundColor(.dark200)
            .autocapitalization(.none)
            .padding(.leading, 2)
            
            Spacer()
            
            Button(action: {
                isSecure.toggle()
            }) {
                Image(systemName: isSecure ? "eye.slash" : "eye")
                    .foregroundColor(.dark400)
            }
        }
        .padding()
        .background(
            LinearGradient(colors: [Color.white.opacity(0.3), Color.white.opacity(0.1)],
                           startPoint: .leading,
                           endPoint: .trailing)
            .background(Color.primary50)
            .cornerRadius(12)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.white.opacity(1), lineWidth: 1)
        )
    }
}

//#Preview {
//    ConfirmPasswordField()
//}
