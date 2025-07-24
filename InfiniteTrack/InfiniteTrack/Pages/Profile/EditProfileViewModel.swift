//
//  EditProfileViewModel.swift
//  InfiniteTrack
//
//  Created by Rizal Hilman on 24/07/25.
//

import SwiftUI

class EditProfileViewModel: ObservableObject {
    
    @Published var userDetail: UserDetail?
    
    // Editable fields
    @Published var fullName: String = ""
    @Published var phoneNumber: String = ""
    @Published var address: String = ""
    
    
    @Published var isAlertPresented: Bool = false
    @Published var isLoading: Bool = false
    @Published var message: String = ""
    
    init() {
        self.getUserDetail()
        print(userDetail)
    }
    
    func onClickLogout() {
        UserDefaultsManager.shared.remove(key: .user)
    }
    
    private func getUserDetail() {
        self.userDetail = UserApi.shared.getUserDetail()
    }
    
    func initEditProfile() {
        self.fullName = userDetail?.userName ?? ""
        self.phoneNumber = userDetail?.phone_number ?? ""
        self.address = userDetail?.address ?? ""
    }
    
    func updateProfile() {
        guard let userId = userDetail?.userId else { return }
        
        Task {
            print("\(userId)")
            if await self.sendUpdatedProfile(userId: "\(userId)", phoneNumber: self.phoneNumber, address: self.address) {
                print(">>> Successfully updated profile")
                self.message = "Successfully updated profile"
                
                // Update local userDetail and UserDefaults
                await MainActor.run {
                    // Update in-memory model
                    self.userDetail?.phone_number = self.phoneNumber
                    self.userDetail?.address = self.address

                    // Save to UserDefaults
                    if let updatedUser = self.userDetail {
                        UserDefaultsManager.shared.set(encodable: updatedUser, key: .user)
                    }
                }
            } else {
                print(">>> Failed to update profile")
                self.message = "Failed to update profile"
            }
            
            isAlertPresented = true
        }
        
    }
    
    func sendUpdatedProfile(userId: String, phoneNumber: String, address: String) async -> Bool {
        await MainActor.run {
            isLoading = true
            message = ""
            isAlertPresented = false
        }
        
        do {
            let response = try await UserApi.shared.updateUserProfile(userId: userId, phoneNumber: phoneNumber, address: address)
            let uiModel = EditProfileUIModel(from: response)
            
            print("uiModel: ", uiModel)
            
            await MainActor.run {
                isLoading = false
            }
            
            return true
        } catch let error as ApiError {
            await MainActor.run {
                switch error {
                case .generalError(let message),
                     .internalServerError(let message):
                    self.message = message
                default:
                    self.message = "Unexpected error occurred."
                }
                isAlertPresented = true
            }
        } catch {
            await MainActor.run {
                self.message = error.localizedDescription
                isAlertPresented = true
            }
        }
        
        await MainActor.run {
            isLoading = false
        }
        
        return false
    }
}
