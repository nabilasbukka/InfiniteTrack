//
//  LatestAttendanceUIModel.swift
//  InfiniteTrack
//
//  Created by Rizal Hilman on 21/07/25.
//

import Foundation

struct LatestAttendanceUIModel: Hashable {
    var name: String
    var profile_photo: String
    var check_in_time: String
    
    init(from response: LatestAttendanceResponse) {
        self.name = response.name ?? ""
        self.profile_photo = response.profile_photo ?? ""
        self.check_in_time = response.check_in_time ?? ""
    }
}
