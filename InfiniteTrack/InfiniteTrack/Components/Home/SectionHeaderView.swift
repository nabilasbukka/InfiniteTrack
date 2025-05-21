//
//  SectionHeaderView.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 15/05/25.
//

import SwiftUI

struct SectionHeaderView: View {
    let title: String
    let showMoreAction: () -> Void

    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.black)

            Spacer()

            NavigationLink {
                AttendanceHistoryView()
            } label: {
                Text("See More")
                    .font(.system(size: 13))
                    .foregroundColor(.primary500)
            }

//            Button(action: showMoreAction) {
//
//            }
        }
    }
}


#Preview {
    SectionHeaderView(title: "Attendance History", showMoreAction: {})
}
