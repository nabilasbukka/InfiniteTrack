//
//  CheckInRequest.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 04/06/25.
//

import Foundation

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
