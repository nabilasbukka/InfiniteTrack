//
//  InfiniteTrackApp.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 26/09/24.
//

import SwiftUI

@main
struct InfiniteTrackApp: App {
    @StateObject var loginState = LoginState()
    @StateObject var navState = NavigationState()
    
    init() {
        checkLogin()
    }
    
    var body: some Scene {
        WindowGroup {
            //            if navState.isShowingFullScreenView {
            //                FullScreenRouterView()
            //                    .environmentObject(navState)
            //            } else {
            //                MainTabView()
            //                    .environmentObject(navState)
            //            }
            
            ZStack {
                if loginState.isLoggedIn {
                    MainTabView()
                        .environmentObject(navState)
                        .environmentObject(loginState)
                        .onAppear{
                            UINavigationBar.appearance().backIndicatorImage = UIImage(systemName: "chevron.left.square")
                            UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage(systemName: "chevron.left.square")
                        }
                } else {
                    LoginView(isLoginSuccess: $loginState.isLoggedIn)
                }
            }
        }
    }
    
    private func checkLogin() {
        if let _: LoginResponse = UserDefaultsManager.shared.get(key: .user) {
            loginState.isLoggedIn = true
        }
    }
}
