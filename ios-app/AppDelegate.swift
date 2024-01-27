//
//  AppDelegate.swift
//  ios-app
//
//  Created by ANNOAMSTERDAM on 19/12/2023.
//

import Foundation
import UIKit


//@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // swiftlint: disable line_length
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        setupMyApp()
        return true
    }

    private func setupMyApp() {
        // TODO: Add any intialization steps here.
        //GMSServices.provideAPIKey("AIzaSyCO9TqyRFRaPahsjpExgy2oc4L0fnc2Y_w")

        print("Application started up!")
    }
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
      // Called when a new scene session is being created.
      // Use this method to select a configuration to create the new scene with.

      return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
      // Called when the user discards a scene session.
      // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
      // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}
