//
//  VerifyOTPUIModel.swift
//  InfiniteTrack
//
//  Created by Rizal Hilman on 14/07/25.
//

import Foundation

struct VerifyOTPUIModel: Hashable {
    let message: String
    
    init(from response: OTPVerificationResponse) {
        self.message = response.message ?? ""
    }
}
