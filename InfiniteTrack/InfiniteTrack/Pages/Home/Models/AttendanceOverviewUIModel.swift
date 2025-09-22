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
        func parseTime(_ raw: String?) -> Date? {
            guard let raw else { return nil }
            return raw.toDate(format: "HH:mm", timeZone: .gmt)
        }

        let checkInDate = parseTime(response.overview?.checkInTime)
        let checkOutDate = parseTime(response.overview?.checkOutTime)

        self.checkInTime = checkInDate?.toString(format: "HH:mm", timeZone: .gmt) ?? "-"
        self.checkOutTime = checkOutDate?.toString(format: "HH:mm", timeZone: .gmt) ?? "-"

        if let inDate = checkInDate, let outDate = checkOutDate {
            let interval = outDate.timeIntervalSince(inDate)
            let totalMinutes = Int(interval) / 60
            let hours = totalMinutes / 60
            let minutes = totalMinutes % 60
            self.totalHours = String(format: "%02d:%02d", hours, minutes)
        } else {
            self.totalHours = "-"
        }
    }
}

