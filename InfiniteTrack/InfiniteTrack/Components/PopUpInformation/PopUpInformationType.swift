//
//  PopUpInformationType.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 10/06/25.
//

import Foundation

enum PopUpInformationType {
    case liveAttendanceConfirmed
    case liveAttendanceLate
    case liveAttendanceOvertime
    
    var title: String {
        switch self {
        case .liveAttendanceConfirmed:
            return "Confirmed"
        case .liveAttendanceLate:
            return "You're Late"
        case .liveAttendanceOvertime:
            return "You Worked Overtime"
        }
    }
    
    var subTitle: String {
        switch self {
        case .liveAttendanceConfirmed:
            return "Consistent/Dicipline"
        case .liveAttendanceLate:
            return "Punctuality"
        case .liveAttendanceOvertime:
            return "Your attendance has been confirmed" 
        }
    }
    
    var imageName: String {
        switch self {
        case .liveAttendanceConfirmed:
            return "ic_confirmed"
        case .liveAttendanceLate:
            return "img_update_profile"
        case .liveAttendanceOvertime:
            return "ic_overtime"
        }
    }
}
