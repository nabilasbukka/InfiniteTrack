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
    let greeting: String?
    let division: String?
    let annualBalance: Int?
    let annualUsed: Int?
    let headprogramname: String?
    var phone_number: String?
    let nip_nim: String?
    var address: String?
    let start_contract: String?
    let end_contract: String?
    let isProfileComplete: String?
    let profilePhoto: String?
}
