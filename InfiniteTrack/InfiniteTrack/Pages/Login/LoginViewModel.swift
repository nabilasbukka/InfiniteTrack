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
        await MainActor.run {
            isLoginSuccess = true
        }
    }
    
    func onClickLogin() {
        errorMessage = ""
        Task {
            do {
                let response: LoginResponse = try await UserApi.shared.login(email: email, password: password)
                await handleSuccessLogin(response: response)
            } catch {
                await MainActor.run {
                    errorMessage = error.localizedDescription
                }
            }
        }
    }
}
