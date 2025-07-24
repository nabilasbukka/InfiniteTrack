//
//  AttendanceOverviewResponse.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 10/06/25.
//

import Foundation

struct AttendanceOverviewResponse: Codable {
    struct Overview: Codable {
        let totalAttendance: Int?
        let late: String?
        let totalAbsence: Int?
        let totalWorkFromOffice: String?
        let totalWorkFromHome: String?
        let activeAttendance: Int?
        let onTime: Int?
        let checkInTime: String?
        let checkOutTime: String?
        
        enum CodingKeys: String, CodingKey {
            case totalAttendance = "total_attendance"
            case late
            case totalAbsence = "total_absence"
            case totalWorkFromOffice = "total_work_from_office"
            case totalWorkFromHome = "total_work_from_home"
            case activeAttendance = "active_attendance"
            case onTime = "on_time"
            case checkInTime = "check_in_time"
            case checkOutTime = "check_out_time"
        }
    }
    
    let message: String?
    let overview: Overview?
}
