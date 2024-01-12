//
//  LocationManager.swift
//  ArdalanWeatherApp
//
//  Created by Ardalan Askarian on 2024-01-01.
//

import Foundation
import CoreLocation // For getting users current location

// Conforming to a few protocols to manage everythign about location without running into error

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    
    // For getting location from user by letting them to choose if they want us to have access to thier location
    @Published var location: CLLocationCoordinate2D?
    
    @Published var isLoading = false
    
    override init(){
        super.init()
        manager.delegate = self
    }
    
    func requestLocation() {
        isLoading = true
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        location = locations.first?.coordinate
        isLoading = false
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting your location", error)
        isLoading=false
    }
}
