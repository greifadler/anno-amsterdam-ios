//
//  ContentView.swift
//  ios-app
//
//  Created by hohe on 12.10.23.
//
import SwiftUI
import CoreLocation
import CoreLocationUI

struct ContentView: View {
    
    @State var isActive = false
    
    @State var newLocationManager =  NewLocationManager()
    
    @StateObject
    var annoStore = AnnoStore()
    
    @State private var selectedTab = 0
    
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    var body: some View {
        if isOnboarding {
            OnboardingPage()
        }  else {
            VStack {
                
                if (self.isActive) {
                    if let location = newLocationManager.location {
                        NavigationView {
                            AnnoTabView()
                                .environmentObject(annoStore)
                                .toolbar {
                                    ToolbarItem(placement: .navigationBarTrailing) {
                                        if(annoStore.isLoading) {
                                            ProgressView()
                                                .tint(.annoBlue)
                                        } else {
                                            Button(action: {
                                                annoStore.reload()
                                            }) {
                                                Image(systemName: "arrow.clockwise.circle")
                                                    .imageScale(.large)
                                                    .tint(.annoBlue)
                                            }
                                        }
                                        
                                    }
                                }
                        }
                    } else {
                        Text("To use this app we need your location!")
                        Text("Click on Loction and then on allow while using" )
                        Link("Click here to open the Settings", destination: URL(string: UIApplication.openSettingsURLString)!)
                    }
                    
                } else {
                    SplashPage()
                }
                
            }
            .task {
                annoStore.locationManager = newLocationManager
                
                try? await newLocationManager.requestUserAuthorization()
                try? await newLocationManager.startCurrentLocationUpdates()
            }
            .onAppear {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
    
    
    
}

#Preview {
    ContentView()
        .environmentObject(AnnoStore())
}
