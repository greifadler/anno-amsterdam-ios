//
//  LocationManager.swift
//  ios-app
//
//  Created by ANNOAMSTERDAM on 02/01/2024.
//

import Foundation
import CoreLocation
import CoreLocationUI

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()

    @Published var location: CLLocationCoordinate2D?
    @Published var locationError: Error? // New property to store location errors


    override init() {
        super.init()
        manager.delegate = self
    }

    func requestLocation() {
        manager.requestLocation()
        locationError = nil // Reset location error
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        locationError = nil // Reset location error
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print (error)
          locationError = error // Store location error
      }
}
