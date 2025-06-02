//
//  InfiniteTrackApp.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 26/09/24.
//

import SwiftUI

@main
struct InfiniteTrackApp: App {
    @State var isLoginSuccess: Bool = false
    @StateObject var navState = NavigationState()
    
    var body: some Scene {
        WindowGroup {
            //            if navState.isShowingFullScreenView {
            //                FullScreenRouterView()
            //                    .environmentObject(navState)
            //            } else {
            //                MainTabView()
            //                    .environmentObject(navState)
            //            }
            
            if isLoginSuccess {
                MainTabView()
                    .environmentObject(navState)
                    .onAppear{
                        UINavigationBar.appearance().backIndicatorImage = UIImage(systemName: "chevron.left.square")
                        UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage(systemName: "chevron.left.square")
                    }
            } else {
                LoginView(isLoginSuccess: $isLoginSuccess)
                    .task {
                        checkLogin()
                    }
            }
        }
    }
    
    private func checkLogin() {
        if let _: LoginResponse = UserDefaultsManager.shared.get(key: .user) {
            isLoginSuccess = true
        }
    }
}
