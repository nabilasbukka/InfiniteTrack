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
    @Published var todayAttendance: AttendanceOverviewUIModel?
    @Published var userDetail: UserDetail?
    @Published var fastestAttendances = [FastestAttendanceUIModel]()
    @Published var latestAttendances = [LatestAttendanceUIModel]()
    
    init() {
        observeUserLocation()
        observeAttendanceUpdates()
        fetchFastestAttendance()
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
                let response = try await AttendanceApi.shared.getAttendanceOverview()
                let uiModel = AttendanceOverviewUIModel(from: response)
                
                await MainActor.run {
                    self.todayAttendance = uiModel
                }
                
            } catch {
                print("Error fetching attendance: \(error.localizedDescription)")
            }
        }
    }
    
    func fetchFastestAttendance() {
        Task {
            do {
                let response = try await AttendanceApi.shared.getFastestAttendances()
                
                
                response.forEach { (attendance) in

                        let uiModel = FastestAttendanceUIModel(from: attendance)
                        self.fastestAttendances.append(uiModel)
                    
                }
            
            } catch {
                print("Error fetching attendance: \(error.localizedDescription)")
            }
        }
    }
    
    func fetchLatestAttendance() {
        Task {
            do {
                let response = try await AttendanceApi.shared.getLatestAttendances()
                
                
                response.forEach { (attendance) in
                        let uiModel = LatestAttendanceUIModel(from: attendance)
                        self.latestAttendances.append(uiModel)
                    
                }
            
            } catch {
                print("Error fetching attendance: \(error.localizedDescription)")
            }
        }
    }
}
