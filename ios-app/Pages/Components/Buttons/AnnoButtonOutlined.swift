//
//  AnnoButtonOutlined.swift
//  ios-app
//
//  Created by ANNOAMSTERDAM on 20/12/2023.
//

import SwiftUI

struct AnnoButtonOutlined<Content: View>: View {
    let action: () -> Void
    var bgColor: Color = .white
    @ViewBuilder let content: Content
    
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 4) {
                content
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                    .foregroundColor(Color(red: 7/255, green: 56/255, blue: 84/255))
                
                Spacer()
            }
            .background(bgColor)
            .cornerRadius(5)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .strokeBorder(Color(red: 197/255, green: 217/255, blue: 224/255), lineWidth: 1)
            )
        }
    }
}

struct AnnoButtonOutlined_Previews: PreviewProvider {
    static var previews: some View {
        AnnoButtonOutlined(action: {}) {
            Text("SwiftUI Button")
            Image(systemName: "arrow.right.circle.fill")
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
