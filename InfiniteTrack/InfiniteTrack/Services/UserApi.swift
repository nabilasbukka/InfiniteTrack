//
//  UserApi.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 02/06/25.
//

import Foundation
import Alamofire

final class UserApi {
    static let shared = UserApi()
    
    func login(email: String, password: String) async throws -> LoginResponse {
        do {
            return try await ApiManager.shared.request(
                endpoint: "/auth/login",
                parameters: ["email": email, "password": password],
                method: .post
            )
        } catch {
            if let afError = error as? AFError,
               let apiError = afError.underlyingError as? ApiError {
                throw apiError
            } else if let apiError = error as? ApiError {
                throw apiError
            } else {
                print("Unhandled error: \(error.localizedDescription)")
                throw NSError(domain: "", code: 3, userInfo: [NSLocalizedDescriptionKey: "Unhandled error"])
            }
        }
    }
    
    // Get user details from UserDefault
    func getUserDetail() -> UserDetail? {
        let userDetail: UserDetail? = UserDefaultsManager.shared.get(key: .user)
        return userDetail
    }
    
    // Send email OTP
    func sendEmailOTP(email: String) async throws -> OTPResponse {
        do {
            return try await ApiManager.shared.request(
                endpoint: "/otp/send-otp",
                parameters: ["email": email],
                method: .post
            )
        } catch {
            if let afError = error as? AFError,
               let apiError = afError.underlyingError as? ApiError {
                throw apiError
            } else if let apiError = error as? ApiError {
                throw apiError
            } else {
                print("Unhandled error: \(error.localizedDescription)")
                throw NSError(domain: "", code: 3, userInfo: [NSLocalizedDescriptionKey: "Unhandled error"])
            }
        }
        
    }
    
    // Verify email OTP
    func verifyEmailOTP(email: String, otp: String) async throws -> OTPVerificationResponse {
    
        do {
            return try await ApiManager.shared.request(
                endpoint: "/otp/verify-otp",
                parameters: ["email": email, "otp": otp],
                method: .post
            )
        } catch {
            
            if let afError = error as? AFError,
               let apiError = afError.underlyingError as? ApiError {
                throw apiError
            } else if let apiError = error as? ApiError {
                throw apiError
            } else {
                print("Unhandled error: \(error.localizedDescription)")
                throw NSError(domain: "", code: 3, userInfo: [NSLocalizedDescriptionKey: "Unhandled error"])
            }
        }
    }
    
    func resetPassword(email: String, newPassword: String) async throws -> ResetPasswordResponse {
        return try await ApiManager.shared.request(
            endpoint: "/auth/reset-password",
            parameters: ["email": email, "newPassword": newPassword],
            method: .post
        )
        
    }
    
}
