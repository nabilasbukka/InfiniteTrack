//
//  EditProfileUIModel.swift
//  InfiniteTrack
//
//  Created by Rizal Hilman on 24/07/25.
//

import Foundation

struct EditProfileUIModel: Hashable {
    let message: String
    
    init(from response: EditProfileResponse) {
        self.message = response.message ?? ""
    }
}
