//
//  HomeViewModel.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 30/05/25.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    
    @Published var locationName: String = "Loading..."
    @Published var currentDate: String = ""
    @Published var todayAttendance: AttendanceHistoryDisplayModel?
    @Published var userDetail: UserDetail?
    
    init() {
        observeUserLocation()
        observeAttendanceUpdates()
    }
    
    private func observeAttendanceUpdates() {
        NotificationCenter.default.publisher(for: Notification.Name("didUpdateAttendance"))
            .sink { [weak self] _ in
                self?.fetchTodayAttendance()
            }
            .store(in: &cancellables)
    }
    
    func onAppear() {
        getUserLocation()
        getCurrentDate()
        getUserDetail()
        fetchTodayAttendance()
        
    }
    
    private func getCurrentDate() {
        currentDate = Date().toString()
    }
    
    private func getUserLocation() {
        LocationManager.shared.requestLocationAccess()
    }
    
    private func getUserDetail() {
        self.userDetail = UserApi.shared.getUserDetail()
    }
    
    private func observeUserLocation() {
        LocationManager.shared.$currentPlacemark
            .compactMap { placemark in
                return placemark?.subLocality
            }
            .sink { subLocality in
                // use updated location
                self.locationName = subLocality
            }
            .store(in: &cancellables)
    }
    
    func fetchTodayAttendance() {
        Task {
            do {
                let responses = try await AttendanceApi.shared.getAttendanceHistory()
                let items = responses.map { AttendanceHistoryDisplayModel(from: $0) }
                let today = Date()

                if let todayItem = items.first(where: {
                    Calendar.current.isDate($0.date, inSameDayAs: today)
                }) {
                    await MainActor.run {
                        self.todayAttendance = todayItem
                    }
                } else {
                    await MainActor.run {
                        self.todayAttendance = nil
                    }
                }
            } catch {
                print("Error fetching attendance: \(error.localizedDescription)")
            }
        }
    }

}
