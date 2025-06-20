//
//  ProfileViewModel.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 19/06/25.
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    func onClickLogout() {
        UserDefaultsManager.shared.remove(key: .user)
    }
}
