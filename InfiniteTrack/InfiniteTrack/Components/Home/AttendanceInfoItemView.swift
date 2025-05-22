//
//  AttendanceInfoItemView.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 22/05/25.
//

import SwiftUI

struct AttendanceInfoItemView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.primary50)
                .frame(width: 161, height: 70)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.white, lineWidth: 1)
                )
            
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text("07:00")
                        .font(.system(size: 20))
                        .foregroundColor(.dark500)
                        .fontWeight(.medium)
                    
                    Spacer()
                    
                    Image("ic_arrow_down_left_circle_fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                
                Text("Checked In")
                    .font(.system(size: 12))
                    .foregroundColor(.dark100)
                    .fontWeight(.medium)
            }
            .padding(12)
            .frame(width: 161, height: 70, alignment: .topLeading)
        }
    }
}

#Preview {
    AttendanceInfoItemView()
}
