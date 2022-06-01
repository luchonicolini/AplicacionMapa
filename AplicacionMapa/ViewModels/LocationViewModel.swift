//
//  LocationViewModel.swift
//  AplicacionMapa
//
//  Created by Luciano Nicolini on 30/05/2022.
//

import MapKit
import Foundation
import SwiftUI

class LocationViewModel: ObservableObject {
    @Published var locations: [Location]
    @Published var mapLocation: Location {
        didSet {
            updateMakRegion(location: mapLocation)
        }
    }
    
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1 , longitudeDelta: 0.1)
    
    @Published var showLocationList: Bool = false
    
    //backboton
    @Published var sheetLocation: Location? = nil
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.updateMakRegion(location: locations.first!)
    }
    private func updateMakRegion(location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(center: location.coordinates, span: mapSpan)
        }
    }
    func togglelocationlist() {
        withAnimation(.easeInOut) {
            showLocationList = !showLocationList
        }
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationList = false
        }
    }
   
    //accionboton
    func nextButtonPressed() {
        guard let currenIndex = locations.firstIndex(where: { $0 == mapLocation}) else {
            print("not find current")
            return
        }
  
        let nextIndex = currenIndex + 1
        guard locations.indices.contains(nextIndex) else {
       
        guard let firsLocation = locations.first else { return }
        showNextLocation(location: firsLocation)
        return
        }
        
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
    }
}
