//
//  LiveAttendanceViewModel.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 20/05/25.
//

import Foundation
import UIKit

class LiveAttendanceViewModel: ObservableObject {
    @Published var currentTime: String = ""
    @Published var currentDate: String = ""
    @Published var isShowingCamera: Bool = false
    @Published var capturedImage: UIImage? = nil
    private var timer: Timer?
    
    init() {
        startUpdatingTime()
    }
    
    private func startUpdatingTime() {
        updateTime()
        timer = Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { [weak self] _ in
            self?.updateTime()
        }
    }
    
    private func updateTime() {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        currentTime = formatter.string(from: Date())
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, dd MMM yyyy"
        currentDate = dateFormatter.string(from: Date())
    }
    
    deinit {
        timer?.invalidate()
    }
    
    func openCamera() {
        isShowingCamera = true
    }

    func setImage(_ image: UIImage) {
        capturedImage = image
    }
}
