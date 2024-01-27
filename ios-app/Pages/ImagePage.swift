//
//  ImagePage.swift
//  ios-app
//
//  Created by ANNOAMSTERDAM on 04/01/2024.
//

import Foundation
import SwiftUI

struct ImagePage: View {
    
    var image: LocalImage
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            Divider()
                .frame(width: .infinity)
                .overlay(.annoLight)
                .padding(.bottom, 20-8)
            
            AnnoImageView(imageLink: image.url, maxWidth: .infinity, maxHeigth: 500, contentDescription: image.source, cornerRadius: 5)
            
            Text(image.year.formatAnnoYear())
                .font(
                    Font.custom("Noto Serif", size: 20)
                        .weight(.medium)
                )
                .foregroundColor(Color(red: 0.65, green: 0, blue: 0.01))
                .frame(maxWidth: .infinity, alignment: .topLeading)

            Text(image.source)
                .font(Font.custom("Noto Serif", size: 14))
                .foregroundColor(Color(red: 0, green: 0.26, blue: 0.35))
                .frame(width: 326, alignment: .topLeading)
            Spacer()
        }
        .padding(20) // Optional padding around the entire content
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "xmark.circle.fill") // Replace with the name of your X icon
                                .font(.system(size: 24))
                                .foregroundColor(.annoBlue) // Adjust the color as needed
                        }
            }
        }
    }
}
#Preview {
    ImagePage(image: LocalBuilding.demoBuildingData().first!.mainImageLink)
}
