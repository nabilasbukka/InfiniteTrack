//
//  LoginViewModel.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 02/06/25.
//

import Foundation
import Combine

final class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    @Published var isButtonLoginEnabled: Bool = false
    @Published var isLoginSuccess: Bool = false
    @Published var isLoading: Bool = false
    private var cancellables: Set<AnyCancellable> = .init()
    
    init() {
        observeEmailPassword()
    }
    
    private func observeEmailPassword() {
        Publishers.CombineLatest($email, $password)
            .sink { [weak self] email, password in
                self?.isButtonLoginEnabled = email.isNotEmpty && password.isNotEmpty
            }
            .store(in: &cancellables)
    }
    
    private func handleSuccessLogin(response: LoginResponse) async {
        UserDefaultsManager.shared.set(encodable: response, key: .user)
        UserDefaultsManager.shared.set(encodable: response.token, key: .token)
        await MainActor.run {
            isLoginSuccess = true
        }
    }
    
    func onClickLogin() {
        isLoading = true
        errorMessage = ""
        Task {
            do {
                let response: LoginResponse = try await UserApi.shared.login(email: email, password: password)
                await handleSuccessLogin(response: response)
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
                default: break
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
}
