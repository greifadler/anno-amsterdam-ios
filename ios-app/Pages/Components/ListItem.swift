//
//  ListItem.swift
//  ios-app
//
//  Created by ANNOAMSTERDAM on 14/12/2023.
//

import Foundation
import SwiftUI

struct ListItem: View {
    var streetName: String
    var buildingYear: String
    var imageLink: String
    var typeOfUse: String
    var distance: Int
    
    var body: some View {
       
            
            VStack {
                HStack {
                    AnnoImageView(imageLink: imageLink, maxWidth: 90, maxHeigth: 140, contentDescription: imageLink, cornerRadius: 5)
                        .padding(.trailing, 20)
                    
                    VStack(alignment: .leading) {
                        Text(streetName.uppercased())
                            .font(.custom("Oswald-Regular", size: 16))
                            .lineLimit(1)
                            .foregroundColor(Color("AnnoBlue"))
                        
                        Text(buildingYear)
                            .font(.custom("NotoSerif-Medium", size: 22))
                            .lineLimit(1)
                            .foregroundColor(Color("AnnoRed"))
                        
                        TransparentAnnoBadge(title1: "Distance", text1: "\(distance)m", title2: "Type of use", text2: typeOfUse,
                                             withoutBorder: true)
                    }
                    
                    Spacer()
                }
                .padding(0)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                
                
            }
        
    }
}

struct ListItem_Previews: PreviewProvider {
    static var previews: some View {
        ListItem(streetName: "Street Name", buildingYear: "2023", imageLink: "imageURL", typeOfUse: "Type of Use", distance: 5)
    }
}
