//
//  AnnoMarker.swift
//  ios-app
//
//  Created by ANNOAMSTERDAM on 02/01/2024.
//

import Foundation
import SwiftUI

struct AnnoMarker: View {
    var outerFillColor: Color
    
    init(year: Int? = nil, outerFillColor: Color? = nil) {
        if let year = year {
            self.outerFillColor = getColorForYear(year: year)
        } else if let fillColor = outerFillColor {
            self.outerFillColor = fillColor
        } else {
            self.outerFillColor = .gray // Default color
        }
    }

    var body: some View {
        ZStack {
            // Outer path representing the shape with a blue fill
            Path { path in
                path.move(to: CGPoint(x: 0, y: 0))
                path.addLine(to: CGPoint(x: 20, y: 0))
                path.addLine(to: CGPoint(x: 20, y: 20))
                path.addLine(to: CGPoint(x: 10, y: 30))
                path.addLine(to: CGPoint(x: 0, y: 20))
                path.addLine(to: CGPoint(x: 0, y: 0))
            }
            .fill(outerFillColor) // Set the outer fill color to blue
            
            // Inner rectangle with a fixed white fill
            Path { path in
                path.addRect(CGRect(x: 6, y: 6, width: 8, height: 8))
            }
            .fill(Color.white) // Inner rectangle is fixed as white
        }
    }
    

}


func getColorForYear(year: Int) -> Color {
    // Define color mappings based on centuries
    let colorMappings: [(Range<Int>, Color)] = [
        (10..<16, .annoRed),    // 1000-2100
        (17..<18, .annoBlue),    // 1000-2100
        (18..<19, .green),    // 1000-2100
        (19..<20, .orange),    // 1000-2100
        (21..<22, .yellow),  // 2100-2200
        (22..<23, .red),    // 2200-2300
        // Add more mappings as needed
    ]

    // Find the matching color for the year's century
    for (range, color) in colorMappings {
        if range.contains(year / 100) {
            return color
        }
    }

    // Default color
    return .gray
}
