//
//  InputOTPViewModel.swift
//  InfiniteTrack
//
//  Created by Rizal Hilman on 14/07/25.
//

import Foundation

class InputOTPViewModel: ObservableObject {
    @Published var isOTPVerified: Bool = false
    @Published var isLoading: Bool = false
    @Published var errorMessage: String = ""
    
    func verifyOTP(inputOTP: String, serverOTP: String, email: String) async -> Bool {
        do {
            let response = try await UserApi.shared.verifyEmailOTP(email: email, otp: inputOTP)
            
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
    
    func resendEmailOTP(email: String) async {
        
        await MainActor.run {
            isLoading = true
            errorMessage = ""
        }
        
        Task {
            do {
                let response = try await UserApi.shared.sendEmailOTP(email: email)
                await handleSuccessResend(response: response)
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
        }
    }
    
    private func handleSuccessResend(response: OTPResponse) async {
        let uiModel = EmailOTPUIModel(from: response)
        print(uiModel)
        
        await MainActor.run {
//            self.data = uiModel
        }
    }
    
    func getUserDetail() -> UserDetail? {
        let userDetail: UserDetail? = UserDefaultsManager.shared.get(key: .user)
        return userDetail
    }
}
