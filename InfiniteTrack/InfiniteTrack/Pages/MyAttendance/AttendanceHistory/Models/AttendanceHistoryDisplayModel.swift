//
//  AttendanceHistoryDisplayModel.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 04/06/25.
//

import Foundation

struct AttendanceHistoryDisplayModel: Identifiable {
    let id = UUID()
    let textDate: String
    let textMonthYear: String
    let checkInTime: String
    let checkOutTime: String
    let totalHours: String
    let date: Date
    
    init(from response: AttendanceHistoryResponse) {
        self.date = response.date
        self.textDate = response.attendance_date ?? ""
        self.textMonthYear = response.attendance_month_year ?? ""
        self.checkInTime = response.check_in_time ?? "-"
        self.checkOutTime = response.check_out_time ?? "-"
        
        if let checkIn = response.check_in_time?.toDate(format: "HH:mm"),
           let checkOut = response.check_out_time?.toDate(format: "HH:mm") {
            let interval = checkOut.timeIntervalSince(checkIn)
            let hours = Int(interval) / 3600
            let minutes = (Int(interval) % 3600) / 60
            self.totalHours = String(format: "%02d:%02d", hours, minutes)
        } else {
            self.totalHours = "-"
        }
    }
}
