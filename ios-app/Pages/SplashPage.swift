//
//  SplashPage.swift
//  ios-app
//
//  Created by hohe on 27.11.23.
//

import SwiftUI

struct SplashPage: View {
    var body: some View {
        ZStack {
            Color(.annoBlue).edgesIgnoringSafeArea(.all)
            VStack {
                   Spacer() // Pushes content to the top
                   
                   Image(.annoWhite)
                       .frame(width: 256, height: 56)
                   
                   Text("Amsterdam".uppercased())
                       .font(
                        Font.custom("Oswald", size: 33)
                               .weight(.light)
                       )
                       .foregroundColor(.annoLightRed)
                   
                   Spacer() // Pushes content to the center vertically
                   
                   Image(.annoBuildings)
                       .frame(width: 744, height: 415)
                   
                   //Spacer() // Pushes content to the bottom
               }
        }
    }
}

#Preview {
    SplashPage()
}
