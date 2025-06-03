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

struct CheckInRequest: Codable {
    let attendanceCategory: String
    let latitude: String
    let longitude: String
    let action: String
    let notes: String
    
    enum CodingKeys: String, CodingKey {
        case attendanceCategory = "attendance_category"
        case latitude
        case longitude
        case action
        case notes
    }
}
