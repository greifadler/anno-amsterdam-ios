//
//  BuildingPreviewCard.swift
//  ios-app
//
//  Created by ANNOAMSTERDAM on 14/12/2023.
//

import Foundation

import SwiftUI

struct BuildingPreviewCard: View {
    var name: String
    var year: Int
    var distance: String
    var typeOfUse: String
    var onExit: () -> Void

    var body: some View {
        VStack {
            HStack {
                Text(name.uppercased())
                    .font(.custom("Oswald-Regular", size: 16))
                    .foregroundColor(Color("AnnoBlue"))
                Spacer()
                Button(action: {
                    onExit()
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(Color("AnnoBlue"))
                        .font(.system(size: 20))
                }
            }
            .padding(.horizontal, 16)
            Spacer().frame(height: 8)
            Text("Anno \(year)")
                .font(.custom("NotoSerif-Bold", size: 22))
                .foregroundColor(Color("AnnoRed"))
                .padding(.bottom, 16)
            TransparentAnnoBadge(title1: "Distance to", text1: distance, title2: "Type of use", text2: typeOfUse, withoutBorder: true)
        }
        .frame(width: 248)
        .background(RoundedRectangle(cornerRadius: 5).fill(Color.white).shadow(color: Color("AnnoBlue"), radius: 4)) //15%!! TODO
    }
}

#Preview {
    BuildingPreviewCard(
        name: "Sample Name",
        year: 2023,
        distance: "1 mile",
        typeOfUse: "Residential",
        onExit: {}
    )
}
