//
//  Breathe_EasyApp.swift
//  Breathe Easy
//
//  Created by Amogh Kuppa on 10/28/23.
//

import SwiftUI
import Firebase
import GoogleSignIn
import CoreLocation
import UIKit

@main
struct Breathe_EasyApp: App {
    
    // connecting app delegate
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject,UIApplicationDelegate{
    
    var locationManager: CLLocationManager?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        // initialize firebase
        FirebaseApp.configure()
        
        // handle when app is relaunched in background due to location change
        locationManager = CLLocationManager()
        locationManager?.delegate = DeviceLocationService.shared

        // Check if launched due to a location event
        if launchOptions?[.location] != nil {
            DeviceLocationService.shared.startMonitoringSignificantLocationChanges()
        }
        
        return true
    }
    
    func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
      return GIDSignIn.sharedInstance.handle(url)
    }
}

