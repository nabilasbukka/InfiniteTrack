//
//  BasicResponse.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 02/06/25.
//

import Foundation

struct BasicResponse: Codable, LocalizedError {
    let message: String?
    var errorDescription: String? {
        return message
    }
}
