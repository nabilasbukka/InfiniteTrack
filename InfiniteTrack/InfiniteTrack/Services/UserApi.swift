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
    
    // Send email OTP
    func sendEmailOTP(email: String) async throws -> OTPResponse {
        try await ApiManager.shared.request(
            endpoint: "/otp/send-otp",
            parameters: ["email": email],
            method: .post
        )
    }
    
    // Verify email OTP
    func verifyEmailOTP(email: String, otp: String) async throws -> OTPVerificationResponse {
        print(email, otp)
        
        return try await ApiManager.shared.request(
            endpoint: "/otp/verify-otp",
            parameters: ["email": email, "otp": otp],
            method: .post
        )
    }
    
    func resetPassword(email: String, newPassword: String) async throws -> ResetPasswordResponse {
        return try await ApiManager.shared.request(
            endpoint: "/auth/reset-password",
            parameters: ["email": email, "newPassword": newPassword],
            method: .post
        )
        
    }
    
}
