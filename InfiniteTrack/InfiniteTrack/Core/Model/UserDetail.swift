//
//  UserDetail.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 02/06/25.
//

import Foundation

struct UserDetail: Codable {
    let email: String?
    let token: String?
    let userId: Int?
    let userName: String?
    let userRole: String?
    let positionName: String?
    let message: String?
}
