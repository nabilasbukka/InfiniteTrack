//
//  InputOTPViewModel.swift
//  InfiniteTrack
//
//  Created by Rizal Hilman on 14/07/25.
//

import Foundation

class InputOTPViewModel: ObservableObject {
    @Published var isOTPVerified: Bool = false
    
    var data: EmailOTPUIModel?
    var email: String?
    
    
    func verifyOTP(otp: String) async {
        
        guard let email = email else { return }

        do {
            let response = try await UserApi.shared.verifyEmailOTP(email: email, otp: otp)
            let uiModel = VerifyOTPUIModel(from: response)
            
            print(response)
            print(uiModel.message)
            
            await MainActor.run {
                self.isOTPVerified = uiModel.message == "OTP verified"
            }
        } catch {
            print("Error fetching attendance: \(error.localizedDescription)")
        }
    }
    
    func resendEmailOTP() async {
        
        guard let email = email else { return }

        do {
            let response = try await UserApi.shared.sendEmailOTP(email: email)
            let uiModel = EmailOTPUIModel(from: response)
            
            print(response)
            print(uiModel.message)
            
            await MainActor.run {
                self.data = uiModel
            }
        } catch {
            print("Error fetching attendance: \(error.localizedDescription)")
        }
    }
    
    func getUserDetail() -> UserDetail? {
        let userDetail: UserDetail? = UserDefaultsManager.shared.get(key: .user)
        return userDetail
    }
}
