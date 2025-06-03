//
//  String+Extension.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 03/06/25.
//

import Foundation

extension String {
    func toDate(format: String = "EEEE, dd MMMM yyyy") -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: self) ?? .now
    }
}
