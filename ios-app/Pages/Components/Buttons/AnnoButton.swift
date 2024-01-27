//
//  AnnoButton.swift
//  ios-app
//
//  Created by ANNOAMSTERDAM on 20/12/2023.
//

import Foundation
import SwiftUI

struct AnnoButton<Content: View>: View {
    let action: () -> Void
    @ViewBuilder let content: Content
    
    var body: some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(Color(red: 166/255, green: 0, blue: 1/255))
                
                VStack {
                    content
                        .padding(10)
                        .foregroundColor(.white)
                    
                    Spacer()
                }
            }
        }
    }
}

struct AnnoButton_Previews: PreviewProvider {
    static var previews: some View {
        AnnoButton(action: {}) {
            Text("SwiftUI Button")
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
