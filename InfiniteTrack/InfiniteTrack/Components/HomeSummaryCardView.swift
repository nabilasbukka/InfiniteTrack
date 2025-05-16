//
//  HomeSummaryCardView.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 14/05/25.
//

import SwiftUI

struct HomeSummaryCardView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Good Morning🌞,")
                        .foregroundColor(.dark400)
                        .font(.system(size: 10))
                    Text("Mhmmd Febriyadi")
                        .foregroundColor(.dark500)
                        .font(.system(size: 20))
                    Text("Mobile Development")
                        .foregroundColor(.dark300)
                        .font(.system(size: 12))
                }
                
                Spacer()
                
                Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 34, height: 34)
            }

            VStack(alignment: .leading) {
                Text("Available Leave Days")
                    .foregroundColor(.black)
                    .font(.system(size: 10))
                    .fontWeight(.thin)
                Text("8 Days")
                    .foregroundColor(.dark500)
                    .font(.system(size: 20))
                Text("2 Used of 10")
                    .foregroundColor(.black)
                    .font(.system(size: 11))
                    .fontWeight(.thin)
                
                ProgressView(value: 0.8)
                    .progressViewStyle(LinearProgressViewStyle())
                    .accentColor(.primary500)
                    .frame(height: 8)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(4)
            }
            .padding(.top, 12)
            
            HStack(spacing: 87) {
                ForEach(0..<2, id: \.self) { _ in
                    DashboardFeatureItemView(
                        imageName: "LiveAttandance",
                        title: "Live Attandance"
                    )
                }
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.top, 11)
        }
        .padding(10)
        
        .background(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.white.opacity(0.5), lineWidth: 1)
        )
        .padding(.horizontal, 10)
    }
}

#Preview {
    HomeSummaryCardView()
}
