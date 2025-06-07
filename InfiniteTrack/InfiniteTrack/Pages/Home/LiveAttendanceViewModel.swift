//
//  LiveAttendanceViewModel.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 20/05/25.
//

import Foundation
import UIKit
import Combine

class LiveAttendanceViewModel: ObservableObject {
    @Published var currentTime: String = ""
    @Published var currentDate: String = ""
    @Published var isShowingCamera: Bool = false
    @Published var capturedImage: UIImage? = nil
    @Published var checkInStatus: String = ""
    @Published var errorMessage: String? = nil
    @Published var attendanceType: AttendanceType = .office
    @Published var attendanceAction: AttendanceAction = .checkIn
    @Published var notes: String = ""
    private var userLocation: (latitude: Double, longitude: Double)?
    private var timer: Timer?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        startUpdatingTime()
        observeUserLocation()
    }
    
    func onAppear() {
        getUserLocation()
        getAttendanceHistory()
    }
    
    private func startUpdatingTime() {
        updateTime()
        timer = Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { [weak self] _ in
            self?.updateTime()
        }
    }
    
    private func updateTime() {
        currentTime = Date().toString(format: "HH:mm")
        currentDate = Date().toString(format: "EEE, dd MMM yyyy")
    }
    
    deinit {
        timer?.invalidate()
    }
    
    func submitAttendance() {
        Task {
            guard let userLocation else { return }
            let body = CheckInRequest(
                attendanceCategory: attendanceType.rawValue,
                latitude: "\(userLocation.latitude)",
                longitude: "\(userLocation.longitude)",
                action: attendanceAction.rawValue,
                notes: notes
            )
            do {
                let response = try await AttendanceApi.shared.checkIn(body: body, image: capturedImage)
                print(response)
                
                // Update HomeViewModel's todayAttendance after successful check-in/check-out
                await MainActor.run {
                    NotificationCenter.default.post(name: Notification.Name("didUpdateAttendance"), object: nil)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    private func observeUserLocation() {
        LocationManager.shared.$currentLocation
            .sink { location in
                self.userLocation = (
                    latitude: location?.coordinate.latitude ?? 0,
                    longitude: location?.coordinate.longitude ?? 0
                )
            }
            .store(in: &cancellables)
    }
    
    private func getUserLocation() {
        LocationManager.shared.requestLocationAccess()
    }
    
    private func getAttendanceHistory() {
        Task {
            do {
                let responses = try await AttendanceApi.shared.getAttendanceHistory()
                await checkAttendanceAction(attendanceHistories: responses)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    private func checkAttendanceAction(attendanceHistories: [AttendanceHistoryResponse]) async {
        for item in attendanceHistories {
            if Calendar.current.isDateInToday(item.date) {
                await MainActor.run {
                    attendanceAction = .checkOut
                }
                break
            }
        }
    }
    
    func openCamera() {
        isShowingCamera = true
        // tampilkan kamera
        // get captured image
    }
    
    func setImage(_ image: UIImage) {
        capturedImage = image
    }
}
