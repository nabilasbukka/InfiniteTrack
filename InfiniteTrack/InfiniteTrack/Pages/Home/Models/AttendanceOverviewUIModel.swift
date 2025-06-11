//
//  AttendanceOverviewUIModel.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 10/06/25.
//

import Foundation

struct AttendanceOverviewUIModel {
    let checkInTime: String
    let checkOutTime: String
    let totalHours: String
    
    init(from response: AttendanceOverviewResponse) {
        var checkInTime: String = "-"
        var checkOutTime: String = "-"
        var totalHours: String = "-"
        
        if let checkInTimeValue = response.overview?.checkInTime {
            let checkInDateObj = checkInTimeValue.toDate(format: "HH:mm", timeZone: .gmt)
            checkInTime = checkInDateObj.toString(format: "HH:mm", timeZone: .current)
            if let checkOutTimeValue = response.overview?.checkOutTime {
                let checkOutDateObj = checkOutTimeValue.toDate(format: "HH:mm", timeZone: .gmt)
                checkOutTime = checkOutDateObj.toString(format: "HH:mm", timeZone: .current)
                let interval = checkOutDateObj.timeIntervalSince(checkInDateObj)
                let totalMinutes = Int(interval) / 60
                let hours = totalMinutes / 60
                let minutes = totalMinutes % 60
                totalHours = String(format: "%02d:%02d", hours, minutes)
            }
        }
        self.checkInTime = checkInTime
        self.checkOutTime = checkOutTime
        self.totalHours = totalHours
    }
}
