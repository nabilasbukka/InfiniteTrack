//
//  Color+Extension.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 14/05/25.
//

import SwiftUI

extension Color {
    init(hex: String) {
        // Remove any unwanted characters like # or spaces
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)

        if hexSanitized.hasPrefix("#") {
            hexSanitized.removeFirst()
        }

        // Make sure the hex string is valid
        if hexSanitized.count != 6 {
            self.init(uiColor: .systemBackground)
        }

        // Convert hex string to RGB components
        var rgb: UInt64 = 0
        let scanner = Scanner(string: hexSanitized)
        if !scanner.scanHexInt64(&rgb) {
            self.init(uiColor: .systemBackground)
        }

        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0

        self.init(.sRGB, red: red, green: green, blue: blue, opacity: 1.0)
    }
}

extension Color {
    // MARK: - Primary
    static let primary50 = Color(hex: "#F3ECFF")
    static let primary100 = Color(hex: "#DBC3FF")
    static let primary200 = Color(hex: "#C9A6FF")
    static let primary300 = Color(hex: "#B17DFF")
    static let primary400 = Color(hex: "#A164FF")
    static let primary500 = Color(hex: "#8A3DFF")
    static let primary600 = Color(hex: "#7E38E8")
    static let primary700 = Color(hex: "#622BB5")
    static let primary800 = Color(hex: "#4C228C")
    static let primary900 = Color(hex: "#3A1A6B")

    // MARK: - Secondary
    static let secondary50 = Color(hex: "#FFFAEA")
    static let secondary100 = Color(hex: "#FFF0BD")
    static let secondary200 = Color(hex: "#FFE89D")
    static let secondary300 = Color(hex: "#FFDE70")
    static let secondary400 = Color(hex: "#FFD754")
    static let secondary500 = Color(hex: "#FFCD29")
    static let secondary600 = Color(hex: "#E8BB25")
    static let secondary700 = Color(hex: "#B5921D")
    static let secondary800 = Color(hex: "#8C7117")
    static let secondary900 = Color(hex: "#6B5611")

    // MARK: - Dark
    static let dark50 = Color(hex: "#EAE9EA")
    static let dark100 = Color(hex: "#BFBBBF")
    static let dark200 = Color(hex: "#9F9BA0")
    static let dark300 = Color(hex: "#746D74")
    static let dark400 = Color(hex: "#595159")
    static let dark500 = Color(hex: "#2F2530")
    static let dark600 = Color(hex: "#2B222C")
    static let dark700 = Color(hex: "#211A22")
    static let dark800 = Color(hex: "#1A141A")
    static let dark900 = Color(hex: "#141014")

    // MARK: - violet
    static let violet50 = Color(hex: "#F7F6F8")
    static let violet100 = Color(hex: "#E7E4E9")
    static let violet200 = Color(hex: "#DBD7DF")
    static let violet300 = Color(hex: "#CAC5D0")
    static let violet400 = Color(hex: "#C0B9C7")
    static let violet500 = Color(hex: "#B0A8B9")
    static let violet600 = Color(hex: "#A099A8")
    static let violet700 = Color(hex: "#7D7783")
    static let violet800 = Color(hex: "#615C66")
    static let violet900 = Color(hex: "#4A474E")

    // MARK: - State
    static let stateRed = Color(hex: "#FF0000")
    static let stateDarkRed = Color(hex: "#D42323")
    static let stateDeepRed = Color(hex: "#911414")
}
