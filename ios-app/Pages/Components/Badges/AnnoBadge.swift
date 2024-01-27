//
//  AnnoBadge.swift
//  ios-app
//
//  Created by ANNOAMSTERDAM on 20/12/2023.
//

import Foundation
import SwiftUI

struct AnnoBadge: View {
    let text: String
    
    var body: some View {
        VStack {
            Text(text)
                .font(.custom("NotoSerif-Regular", size: 24))
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding(10)
            
            Spacer()
        }
        .background(content: {
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(Color("AnnoRed"))
                .frame(height: 44)
        })
    }
}

struct AnnoBadge_Previews: PreviewProvider {
    static var previews: some View {
        AnnoBadge(text: "SwiftUI")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
