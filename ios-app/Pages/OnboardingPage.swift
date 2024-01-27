//
//  OnboardingPage.swift
//  ios-app
//
//  Created by ANNOAMSTERDAM on 03/01/2024.
//

import Foundation
import SwiftUI

struct OnboardingPage: View {
    @State private var currentPage = 0
    
    var body: some View {
        TabView(selection: $currentPage) {
            OnboardingPageView(
                imageName: "OnboardingFirst",
                title: "Discover Amsterdam's",
                description: "architectural heritage with",
                nextAction: {
                        currentPage += 1
                },
                isLast: false,
                index: 0)
            .tag(0)
            OnboardingPageView(
                imageName: "OnboardingSecond",
                title: "Augmented Reality ",
                description: "The Window to Amsterdam's Past",
                nextAction: {
                    currentPage += 1
                },
                isLast: false,
                index: 1)
            .tag(1)
            OnboardingPageView(
                imageName: "OnboardingThird",
                title: "Get Lost in History",
                description: "Navigate Amsterdam's Iconic Buildings on the Map",
                nextAction: {
                    currentPage += 1
                },
                isLast: false,
                index: 2)
            .tag(2)
            OnboardingPageView(
                imageName: "OnboardingFourth",
                title: "Unlock the Building's Secrets",
                description: "Explore Detailed Information",
                nextAction: {},
                isLast: true,
                index: 3)
            .tag(3)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.annoBlue) // Assuming you want a black background
        .edgesIgnoringSafeArea(.all)
    }
}

struct OnboardingPageView: View {
    var imageName: String
    var title: String
    var description: String
    var nextAction: () -> Void
    var isLast: Bool
    var index: Int
    
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    
    
    var body: some View {
        VStack {
            Image(.annoBuildings)
                .frame(width: 375, height: 271)
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
            
            Spacer()
            Text(title)
                .font(
                    Font.custom("Oswald", size: 26)
                        .weight(.medium)
                )
                .foregroundColor(Color(red: 0.77, green: 0.85, blue: 0.88))
                .frame(maxWidth: .infinity, alignment: .center)
                .multilineTextAlignment(.center)
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))

            
            Text(description)
                .font(
                    Font.custom("Oswald", size: 22)
                        .weight(.medium)
                )
                .foregroundColor(Color(red: 0.77, green: 0.85, blue: 0.88))
                .frame(maxWidth: .infinity, alignment: .center)
                .multilineTextAlignment(.center)
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            Spacer()
            Lines(amount: 4, selectedIndex: index )
                .padding()
            HStack {
                if(!isLast) {
                    Button(action: {
                        isOnboarding = false
                    }) {
                        Text("SKIP")
                            .font(Font.custom("Oswald", size: 20).weight(.medium))
                            .foregroundColor(Color(red: 0.77, green: 0.85, blue: 0.88))
                    }
                }
                Spacer()
                Button(action: isLast ? {isOnboarding = false} : {
                    withAnimation {
                        nextAction()
                    }
                }) {
                    HStack(alignment: .center, spacing: 10) {
                        Text(isLast ? "GET STARTED" : "NEXT")
                            .padding(25)
                            .frame(height: 45, alignment: .center)
                            .background(Color(red: 0.85, green: 0.85, blue: 0.85).opacity(0.3))
                            .foregroundColor(.white)
                            .cornerRadius(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .inset(by: 0.5)
                                    .stroke(Color(red: 1, green: 0.39, blue: 0.39), lineWidth: 1)
                            )
                    }
                }
                .font(Font.custom("Oswald", size: 20).weight(.medium)) // Apply the custom font to the Text
                
            }
            .padding(EdgeInsets(top: 0, leading: 30, bottom: 30, trailing: 30))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.annoBlue) // Assuming you want a black background
        .edgesIgnoringSafeArea(.all)
        
    }
}

#Preview(body: {
    OnboardingPage()
})
