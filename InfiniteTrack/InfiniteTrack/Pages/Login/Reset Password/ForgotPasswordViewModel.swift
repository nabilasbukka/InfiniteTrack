//
//  ForgotPasswordViewModel.swift
//  InfiniteTrack
//
//  Created by Rizal Hilman on 14/07/25.
//

import SwiftUI

class ForgotPasswordViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var otpData: EmailOTPUIModel?
    @Published var isAlertErrorPresented: Bool = false
    @Published var errorMessage: String = ""
    
    func sendEmailOTP(email: String) async {
        do {
            let response = try await UserApi.shared.sendEmailOTP(email: email)
            let uiModel = EmailOTPUIModel(from: response)
            
//            print(response)
//            print(uiModel.message)
            
            await MainActor.run {
                self.otpData = uiModel
            }
        } catch {
            print("Error fetching attendanceC: \(error.localizedDescription)")
        }
    }
}
