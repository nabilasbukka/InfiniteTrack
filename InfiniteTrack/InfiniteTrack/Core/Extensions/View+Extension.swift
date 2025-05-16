//
//  View+Extension.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 16/05/25.
//

import Foundation
import SwiftUI

extension View {
    func pageBackground() -> some View {
        return modifier(PageBackgroundViewModifier())
    }
}
