//
//  TransparentAnnoBadge.swift
//  ios-app
//
//  Created by ANNOAMSTERDAM on 14/12/2023.
//

import Foundation

import SwiftUI

struct TransparentAnnoBadge: View {
    var title1: String
    var text1: String
    var title2: String
    var text2: String
    var withoutBorder: Bool

    var body: some View {
        HStack {
            Spacer()
            VStack {
                Text(title1)
                    .font(.custom("NotoSerif-Bold", size: 12))
                    .foregroundColor(Color("AnnoBlue").opacity(0.5))
                    .multilineTextAlignment(.leading)
                Text(text1)
                    .font(.custom("NotoSerif-Regular", size: 16))
                    .foregroundColor(Color("AnnoBlue"))
                    .multilineTextAlignment(.leading)

            }
            Divider()
                .frame(width: 1, height: 60)
                .overlay(Color("AnnoLight"))
                .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
            VStack {
                Text(title2)
                    .font(.custom("NotoSerif-Bold", size: 12))
                    .foregroundColor(Color("AnnoBlue").opacity(0.5))
                    .multilineTextAlignment(.leading)

                Text(text2)
                    .font(.custom("NotoSerif-Regular", size: 16))
                    .foregroundColor(Color("AnnoBlue"))
                    .multilineTextAlignment(.leading)

            }
            Spacer()
        }
        .border(withoutBorder ? .clear : .annoLight)
        .cornerRadius(5)
    }
}
