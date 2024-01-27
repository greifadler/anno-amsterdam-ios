//
//  AnimatedIconView.swift
//  ios-app
//
//  Created by admin on 1/21/24.
//

import SwiftUI
struct AnimatedIconView: View {
    var iconSystemName: String
    @State private var isAnimating = false

    let animationDuration: Double = 0.6

    var body: some View {
        Image(systemName: iconSystemName) // Use your desired icon name here
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 50, height: 50)
            .scaleEffect(isAnimating ? 1.1 : 1.0)
            .onAppear {
                withAnimation(Animation.easeInOut(duration: animationDuration).repeatForever(autoreverses: true)) {
                    isAnimating = true
                }
            }
    }
}
