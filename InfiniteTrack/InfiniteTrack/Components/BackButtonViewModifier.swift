//
//  BackButtonViewModifier.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 21/05/25.
//

import Foundation
import SwiftUI

struct BackButtonViewModifier: ViewModifier {
    @Environment(\.presentationMode) var presentationMode
    
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left.square")
                            .font(.title2)
                            .foregroundColor(Color.primary500)
                    }
                }
            }
    }
}
