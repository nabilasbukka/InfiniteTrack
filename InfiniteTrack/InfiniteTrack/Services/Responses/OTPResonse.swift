//
//  OTPResonse.swift
//  InfiniteTrack
//
//  Created by Rizal Hilman on 14/07/25.
//

import Foundation

struct OTPResponse: Codable {
    let message: String?
    let otp: String?
}
