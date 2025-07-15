//
//  InputNewPasswordViewModel.swift
//  InfiniteTrack
//
//  Created by Rizal Hilman on 14/07/25.
//

import SwiftUI

class InputNewPasswordViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var newPassword: String = ""
    @Published var confirmNewPassword: String = ""
    
    var isPasswordMismatch: Bool {
        !confirmNewPassword.isEmpty && newPassword != confirmNewPassword
    }
    func validatePassword() async -> Bool {
        guard !newPassword.isEmpty else {
            return false
        }
        return true
    }
    
    func updateNewPassword(email: String, newPassword: String) async {

        do {
            let response = try await UserApi.shared.resetPassword(email: email, newPassword: newPassword)
            let uiModel = ResetPasswordUIModel(from: response)
            
            print(response)
            print(uiModel.message)
            
            await MainActor.run {
//                self.data = uiModel
            }
        } catch {
            print("Error fetching attendance: \(error.localizedDescription)")
        }
    }
}
