//
//  InfiniteTrackApp.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 26/09/24.
//

import SwiftUI

@main
struct InfiniteTrackApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @State var isShowSplash: Bool = true
    @StateObject var loginState = LoginState()
    @StateObject var navState = NavigationState()
    @StateObject private var authRouter = AuthRouter()
    
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
                if !isShowSplash {
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
                } else {
                    SplashScreenView()
                }
            }
            .onAppear {
                checkLogin()
            }
        }
        .environmentObject(authRouter)
    }
    
    private func checkLogin() {
        if let _: LoginResponse = UserDefaultsManager.shared.get(key: .user) {
            loginState.isLoggedIn = true
        }
        // Delay by seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.isShowSplash = false
        }
    }
}
