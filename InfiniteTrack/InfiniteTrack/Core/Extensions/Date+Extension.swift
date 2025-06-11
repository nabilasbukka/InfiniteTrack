//
//  Date+Extension.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 30/05/25.
//

import Foundation

extension Date {
    var startOfDay: Date {
        return Calendar.current.startOfDay(for: self)
    }
    
    var endOfDay: Date {
        var components = Calendar.current.dateComponents([.year, .month, .day], from: self)
        components.hour = 23
        components.minute = 59
        components.second = 59
        return Calendar.current.date(from: components) ?? .now
    }
    
    func toString(format: String = "EEEE, dd MMMM yyyy", timeZone: TimeZone? = nil) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        if let timeZone {
            formatter.timeZone = timeZone
        }
        return formatter.string(from: self)
    }
    
    func backward(days: Int) -> Date {
        let calendar = Calendar.current
        
        if let backwardDay = calendar.date(
            byAdding: .day,
            value: -days,
            to: self
        ) {
            return backwardDay
        }
        
        return self
    }
}
