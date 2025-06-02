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
    @Published var userResponse: UserResponse?
    
    private let userDetail: UserDetail? = UserApi.shared.getUserDetail()
    
    init() {
        observeUserLocation()
    }
    
    func onAppear() {
        getUserLocation()
        getCurrentDate()
        getUserDetail()
    }
    
    private func getCurrentDate() {
        currentDate = Date().toString()
    }
    
    private func getUserLocation() {
        LocationManager.shared.requestLocationAccess()
    }
    
    private func getUserDetail() {
        if let userDetail = userDetail {
            guard let userId = userDetail.userId else { return }
            
            Task {
                do {
                    let response: UserResponse = try await ApiManager.shared.request(endpoint: "/users/get/\(userId)")
                    await MainActor.run {
                        self.userResponse = response
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
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
}
