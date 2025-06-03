//
//  UserApi.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 02/06/25.
//

import Foundation

final class UserApi {
    static let shared = UserApi()
    
    func login(email: String, password: String) async throws -> LoginResponse {
        try await ApiManager.shared.request(
            endpoint: "/auth/login",
            parameters: ["email": email, "password": password],
            method: .post
        )
    }
    
    // Get user details from UserDefault
    func getUserDetail() -> UserDetail? {
        let userDetail: UserDetail? = UserDefaultsManager.shared.get(key: .user)
        return userDetail
    }
}
