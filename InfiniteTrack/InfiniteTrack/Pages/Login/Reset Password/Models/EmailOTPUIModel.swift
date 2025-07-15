//
//  EmailOTP.swift
//  InfiniteTrack
//
//  Created by Rizal Hilman on 14/07/25.
//

import Foundation

struct EmailOTPUIModel: Hashable {
    let message: String
    let otp: String
    
    init(from response: OTPResponse) {
        self.message = response.message ?? ""
        self.otp = response.otp ?? ""
    }
}
