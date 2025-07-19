//
//  InputNewPasswordViewModel.swift
//  InfiniteTrack
//
//  Created by Rizal Hilman on 14/07/25.
//

import SwiftUI

class InputNewPasswordViewModel: ObservableObject {
    
    @Published var newPassword: String = ""
    @Published var confirmNewPassword: String = ""
    @Published var errorMessage: String = ""
    @Published var isLoading: Bool = false
    
    var isPasswordMismatch: Bool {
        !confirmNewPassword.isEmpty && newPassword != confirmNewPassword
    }
    func validatePassword() async -> Bool {
        guard !newPassword.isEmpty else {
            return false
        }
        return true
    }
    
    func updateNewPassword(email: String, newPassword: String) async -> Bool {
        
        do {
            let response = try await UserApi.shared.resetPassword(email: email, newPassword: newPassword)
            
            return true
        } catch let error as ApiError {
            
            switch error {
            case .generalError(let message):
                await MainActor.run {
                    errorMessage = message
                }
            case .internalServerError(let message):
                await MainActor.run {
                    errorMessage = message
                }
            default:
                
                break
            }
        } catch {
            
            await MainActor.run {
                errorMessage = error.localizedDescription
            }
        }
        
        await MainActor.run {
            isLoading = false
        }
        
        return false
    }
}
