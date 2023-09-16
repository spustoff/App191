//
//  App191App.swift
//  App191
//
//  Created by Вячеслав on 9/14/23.
//

import SwiftUI
import FirebaseCore
import ApphudSDK
import Amplitude

class AppDelegate: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Apphud.start(apiKey: "app_gJQVuPTZ82rvXKEtwsDkBEEyNdvueo")
        Amplitude.instance().initializeApiKey("1d600571c5ed34f39b7869a5a2ce7de0")

        FirebaseApp.configure()
        
        return true
    }
}

@main
struct App191App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        
        WindowGroup {
            
            NavigationView(content: {
                
                ContentView()
            })
        }
    }
}
