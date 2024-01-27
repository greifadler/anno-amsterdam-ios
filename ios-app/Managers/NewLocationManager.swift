//
//  NewLocationManager.swift
//  ios-app
//
//  Created by ANNOAMSTERDAM on 02/01/2024.
//

import Foundation
import CoreLocation
import SwiftUI

@Observable
class NewLocationManager {
    var location: CLLocation? = nil
    
    private let locationManager = CLLocationManager()
    
    func requestUserAuthorization() async throws {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func startCurrentLocationUpdates() async throws {
        for try await locationUpdate in CLLocationUpdate.liveUpdates() {
            guard let location = locationUpdate.location else { return }
            
            self.location = location
        }
    }
}
