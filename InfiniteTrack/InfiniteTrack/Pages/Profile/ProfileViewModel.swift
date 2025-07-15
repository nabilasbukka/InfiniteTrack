//
//  ProfileViewModel.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 19/06/25.
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    @Published var userDetail: UserDetail?
    
    init() {
        self.getUserDetail()
    }
    
    func onClickLogout() {
        UserDefaultsManager.shared.remove(key: .user)
    }
    
    private func getUserDetail() {
        self.userDetail = UserApi.shared.getUserDetail()
    }
    
    
}
