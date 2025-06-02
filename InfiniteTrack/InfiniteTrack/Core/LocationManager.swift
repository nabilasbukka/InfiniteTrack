//
//  LocationManager.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 30/05/25.
//

import Foundation
import CoreLocation

final class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let manager = CLLocationManager()
    static let shared = LocationManager()
    
    @Published var currentLocation: CLLocation?
    @Published var currentPlacemark: CLPlacemark?
    @Published var locationDenied: Bool = false

    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
    }

    func requestLocationAccess() {
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .authorizedWhenInUse || manager.authorizationStatus == .authorizedAlways {
            self.manager.startUpdatingLocation()
        } else if manager.authorizationStatus == .denied {
            locationDenied = true
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        currentLocation = location
        fetchPlacemark(for: location)
    }

    func fetchPlacemark(for location: CLLocation) {
        CLGeocoder().reverseGeocodeLocation(location) { placemarks, _ in
            self.currentPlacemark = placemarks?.first
        }
    }
}
