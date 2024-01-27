//
//  Lines.swift
//  ios-app
//
//  Created by ANNOAMSTERDAM on 03/01/2024.
//

import Foundation
import SwiftUI

struct Lines: View {
    var amount: Int
    var selectedIndex: Int
    
    var body: some View {
        HStack(alignment: .center, spacing: 2) {
            ForEach(0..<amount, id: \.self) { index in
                if index == selectedIndex {
                    Rectangle()
                      .foregroundColor(.clear)
                      .frame(width: 30, height: 6)
                      .background(Color(red: 0.77, green: 0.85, blue: 0.88))
                      .cornerRadius(100)
                      .overlay(
                        RoundedRectangle(cornerRadius: 100)
                          .inset(by: 0.5)
                          .stroke(Color(red: 1, green: 0.39, blue: 0.39), lineWidth: 1)
                      )
                } else {
                    Rectangle()
                      .foregroundColor(.clear)
                      .frame(width: 9, height: 6)
                      .background(Color(red: 0.77, green: 0.85, blue: 0.88))
                      .cornerRadius(100)
                }
            }
        }
    }
}

#Preview {
    Lines(amount: 5, selectedIndex: 2)
}
