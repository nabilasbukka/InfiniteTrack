//
//  LoginRouter.swift
//  InfiniteTrack
//
//  Created by Rizal Hilman on 14/07/25.
//

import SwiftUI

enum AuthRoute: Hashable {
    case forgotPassword
    case veryfyEmailOTP(data: EmailOTPUIModel, email: String)
    case updateNewPassword(email: String)
}

class AuthRouter: ObservableObject {
    @Published var path = NavigationPath()
    
    func navigate(to route: AuthRoute) {
        path.append(route)
    }
    
    func goBack() {
        path.removeLast()
    }
    
    func reset() {
        path = NavigationPath()
    }
}
