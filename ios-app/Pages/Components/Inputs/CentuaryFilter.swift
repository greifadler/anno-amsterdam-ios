//
//  CentuaryFilter.swift
//  ios-app
//
//  Created by ANNOAMSTERDAM on 04/01/2024.
//

import SwiftUI

struct CentuaryFilter: View {
    
    let startCentury = 15 // Starting century
    let endCentury = 21   // Ending century
    
    @EnvironmentObject
       var annoStore: AnnoStore
    
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 10) {
                    ForEach(startCentury...endCentury, id: \.self) { century in
                
                        AnnoButtonOutlined(
                            action: {
                                annoStore.filterCentury = annoStore.filterCentury == century ? -1 : century
                        },
                            bgColor: ((annoStore.filterCentury == century) ? Color.annoLight :  Color.white),
                            content: {
                            HStack {
                                AnnoMarker(year: (century * 100))
                                    .frame(width: 20, height: 20)
                                    .clipped()
                                Text("\(century)c.")
                            }
                                
                        })
                    }
            }
            .padding(.horizontal, 16)

        }
    }
}

#Preview {
    CentuaryFilter()
        .environmentObject(AnnoStore())
}
