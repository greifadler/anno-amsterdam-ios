//
//  SmallBadge.swift
//  ios-app
//
//  Created by ANNOAMSTERDAM on 20/12/2023.
//

import Foundation
import SwiftUI

struct SmallBadge: View {
    let text: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .strokeBorder(Color(red: 197/255, green: 217/255, blue: 224/255), lineWidth: 1)
            
            HStack(spacing: 5) {
                Text(text)
                    .font(.custom("NotoSerif", size: 14))
                    .foregroundColor(Color(red: 0/255, green: 66/255, blue: 90/255))
                    .padding(.vertical, 3)
                    .padding(.horizontal, 10)
                
                Spacer()
            }
        }
    }
}

struct SmallBadge_Previews: PreviewProvider {
    static var previews: some View {
        SmallBadge(text: "SwiftUI")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
