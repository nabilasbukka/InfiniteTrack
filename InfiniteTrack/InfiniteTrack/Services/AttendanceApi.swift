//
//  AttendanceApi.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 03/06/25.
//

import Foundation
import Alamofire

final class AttendanceApi {
    static let shared = AttendanceApi()
    
    func checkIn(body: CheckInRequest) async throws -> CheckInResponse {
        return try await ApiManager.shared.request(
            endpoint: "/attendance/users",
            parameters: body.asDictionary ?? [:],
            method: .post
        )
    }
    
    func getAttendanceHistory() async throws -> [AttendanceHistoryResponse] {
        let user: LoginResponse? = UserDefaultsManager.shared.get(key: .user)
        let userId = user?.userId ?? 0
        return try await ApiManager.shared.request(endpoint: "/users/attendance/\(userId)")
    }
}
