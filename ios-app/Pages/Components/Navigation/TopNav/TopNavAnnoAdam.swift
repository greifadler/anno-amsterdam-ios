//
//  TopNavAnnoAdam.swift
//  ios-app
//
//  Created by ANNOAMSTERDAM on 02/01/2024.
//


import SwiftUI

struct TopNavAnnoAdam: View {
    
    var body: some View {
        HStack {
            Image("Anno")
                .frame(width: 90, height: 20)
            Text("Amsterdam".uppercased())
              .font(
                Font.custom("Oswald", size: 22)
                  .weight(.light)
              )
              .foregroundColor(.annoRed)
              .padding(EdgeInsets(top: 0, leading: 0, bottom: 2, trailing: 0))
            }
        }
    }

#Preview {
    TopNavAnnoAdam()
}
