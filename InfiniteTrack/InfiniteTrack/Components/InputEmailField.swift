//
//  InputEmailField.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 26/05/25.
//

import SwiftUI

struct InputEmailField: View {
    @Binding var email: String
    
    var body: some View {
        HStack {
            
            Image(systemName: "envelope")
                .scaledToFit()
                .frame(width: 16, height: 16)
                .foregroundColor(.dark200)

            TextField("Enter your Email", text: $email)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.dark200)
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
                .padding(.leading, 2)
            
            Spacer()
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

#Preview {
    InputEmailField(email: .constant(""))
}
