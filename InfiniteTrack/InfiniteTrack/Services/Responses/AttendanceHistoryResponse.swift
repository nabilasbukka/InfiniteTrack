//
//  AttendanceHistoryResponse.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 03/06/25.
//

import Foundation

struct AttendanceHistoryResponse: Codable {
    let attendanceId: Int?
    let userId: Int?
    let attendance_category: AttendanceType?
    let attendance_status: String?
    let attendance_date: String?
    let attendance_month_year: String?
    let check_in_time: String?
    let check_out_time: String?
    let latitude: Double?
    let longitude: Double?
    let upload_image: String?
    let notes: String?
    
    var date: Date {
        if let attendance_date, let attendance_month_year {
            let dateString = "\(attendance_date) \(attendance_month_year)"
            return dateString.toDate(format: "dd MMM yyyy")
        }
        return .now
    }
}
