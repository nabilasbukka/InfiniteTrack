//
//  AppDelegate.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 24/06/25.
//

import Foundation
import UIKit
import FLEX

final class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FLEXManager.shared.showExplorer()
        return true
    }
}
