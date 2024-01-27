//
//  TimelineRow.swift
//  ios-app
//
//  Created by ANNOAMSTERDAM on 20/12/2023.
//

import SwiftUI

struct TimelineRow: View {
    let year: String
    let text: String

    var body: some View {
        HStack(spacing: 8) {
            Text(year)
                .font(.custom("NotoSerif-Regular", size: 18))
                .fontWeight(.bold)
                .foregroundColor(.annoRed)
                .frame(width: 50)
            
            Circle()
                .stroke(Color.annoBlue, lineWidth: 1) // Adjust the line width as needed
                .frame(width: 9, height: 9)

            
            Text(text)
                .font(.custom("NotoSerif-Regualar", size: 18))
                .foregroundColor(.annoBlue)
            
            Spacer()
        }
        .padding(.vertical, 15)
    }
}
