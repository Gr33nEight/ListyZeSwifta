//
//  ContentView.swift
//  Lista7
//
//  Created by Natanael Jop on 24/02/2025.
//

import SwiftUI
import CoreLocation
import MapKit

struct ContentView: View {
    let position = MapCameraPosition.region(
        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.332914, longitude: -122.005202), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    )
    
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        Map(coordinateRegion: viewModel.binding,showsUserLocation: true,userTrackingMode: .constant(.follow))
                        .edgesIgnoringSafeArea(.all)
                        .onAppear(perform: {
                            viewModel.checkIfLocationIsEnabled()
                        })
        
    }
}

final class ContentViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    var locationManager: CLLocationManager?
    
    @Published var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.332914, longitude: -122.005202), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    var binding: Binding<MKCoordinateRegion> {
            Binding {
                self.mapRegion
            } set: { newRegion in
                DispatchQueue.main.async {
                    self.mapRegion = newRegion
                }
            }
        }
    
    func locationManager(_ manager: CLLocationManager) {
        let previousAuthorizationStatus = manager.authorizationStatus
        manager.requestWhenInUseAuthorization()
        if manager.authorizationStatus != previousAuthorizationStatus {
            checkLocationAuthorization()
        }
    }
    
    func checkIfLocationIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
            locationManager!.delegate = self
        } else {
            print("Not enabled")
        }
    }
    
    private func checkLocationAuthorization() {
        guard let location = locationManager else {
            return
        }
        
        switch location.authorizationStatus {
        case .notDetermined:
            print("Location authorization is not determined.")
        case .restricted:
            print("Location is restricted")
        case .denied:
            print("Location permission denied.")
        case .authorizedAlways, .authorizedWhenInUse:
            if let location = location.location {
                mapRegion = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            }
        default: break
        }
    }
}

#Preview {
    ContentView()
}
