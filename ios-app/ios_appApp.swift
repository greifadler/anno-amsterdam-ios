//
//  ios_appApp.swift
//  ios-app
//
//  Created by hohe on 12.10.23.
//

import SwiftUI

@main
struct ios_appApp: App {
    
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
