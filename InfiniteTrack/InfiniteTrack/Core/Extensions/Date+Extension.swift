//
//  Date+Extension.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 30/05/25.
//

import Foundation

extension Date {
    func toString(format: String = "EEEE, dd MMMM yyyy") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
