//
//  UIApplication+Extension.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 21/06/25.
//

import Foundation
import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
