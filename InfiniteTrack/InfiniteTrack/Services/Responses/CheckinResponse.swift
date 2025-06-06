//
//  CheckinResponse.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 03/06/25.
//

import Foundation

struct CheckInResponse: Codable {
    let message: String
    let attendanceId: Int
    let attendanceStatus: String

    enum CodingKeys: String, CodingKey {
        case message
        case attendanceId
        case attendanceStatus = "attendance_status"
    }
}
