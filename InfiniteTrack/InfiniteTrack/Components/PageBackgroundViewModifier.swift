//
//  PageBackgroundViewModifier.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 16/05/25.
//

import Foundation
import SwiftUI

struct PageBackgroundViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            content
        }
        .background(
            Image(.imgBackground)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .overlay(Color.white.opacity(0.5))
            
        )
    }
}
