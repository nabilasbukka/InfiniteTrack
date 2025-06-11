//
//  String+Extension.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 03/06/25.
//

import Foundation

extension String {
    func toDate(format: String = "EEEE, dd MMMM yyyy", timeZone: TimeZone? = nil) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        if let timeZone {
            formatter.timeZone = timeZone
        }
        return formatter.date(from: self) ?? .now
    }
}
