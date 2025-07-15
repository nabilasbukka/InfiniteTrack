//
//  ResetPasswordUIModel.swift
//  InfiniteTrack
//
//  Created by Rizal Hilman on 14/07/25.
//

import Foundation

struct ResetPasswordUIModel: Hashable {
    let message: String
    
    init(from response: ResetPasswordResponse) {
        self.message = response.message ?? ""
    }
}
