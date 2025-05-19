//
//  CompleteProfileInfoView.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 19/05/25.
//

import SwiftUI

struct CompleteProfileInfoView: View {
    let imageName: String
    let title: String
    let descInfo: String
    let btnActionText: String
    let buttonAction: () -> Void
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.primary50)
                .frame(width: 272, height: 285)
                .cornerRadius(10)
                
            VStack(alignment: .center, spacing: 18) {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 112, height: 111)
                
                Text(title)
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.primary700)
                    .frame(maxWidth: 240)
                
                Text(descInfo)
                    .font(.system(size: 13, weight: .regular))
                    .foregroundColor(.dark500)
                    .frame(maxWidth: 240)
                    .multilineTextAlignment(.center)
                
                Button(action: buttonAction) {
                    Text(btnActionText)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.primary50)
                        .frame(width: 203, height: 39)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.primary500)
                        )
                }
            }
            .frame(width: 252)
            .padding(.horizontal, 10)
        }
    }
}

#Preview {
    CompleteProfileInfoView(imageName: "img_update_profile", title: "Complete your Profile", descInfo: "Please head to Setting and complete your profile", btnActionText: "OK", buttonAction: {})
}
