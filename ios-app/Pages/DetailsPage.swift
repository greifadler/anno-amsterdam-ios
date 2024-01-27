//
//  DetailsPage.swift
//  ios-app
//
//  Created by ANNOAMSTERDAM on 20/12/2023.
//

import Foundation
import SwiftUI
import SwiftUIFlow

struct DetailsPage: View {
    var slimBuilding: LocalBuilding
    
    @EnvironmentObject
    var detailsStore: DetailsStore
    
    var body: some View {
        
        ZStack(alignment: .topLeading) {
            
            
            ScrollView {
                VStack(spacing: 20) {
                    
                    ZStack {
                        NavigationLink(destination:
                                        ImagePage(image: slimBuilding.mainImageLink)
                            .navigationBarBackButtonHidden(true)
                                       
                        ) {
                            
                            AnnoImageView(imageLink: slimBuilding.mainImageLink.url, maxWidth: .infinity, maxHeigth: 240, contentDescription: slimBuilding.mainImageLink.source, cornerRadius: 0)
                        }
                    }
                    .frame(height: 240)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        AnnoBadge(text: "Anno \(slimBuilding.year)")
                        Text(slimBuilding.name.uppercased())
                            .font(.custom("Oswald-Regular", size: 30))
                            .foregroundColor(Color("AnnoBlue"))
                        
                        TransparentAnnoBadge(
                            title1: "Distance",
                            text1: "\(slimBuilding.distance)m",
                            title2: "Type of use",
                            text2: slimBuilding.typeOfUse,
                            withoutBorder: false
                        )
                        
                        switch detailsStore.building {
                        case .success(let fullBuilding):
                            
                        
                            ScrollView(.vertical) {
                                VFlow(alignment: .leading) {
                                    ForEach(building.artefacts, id: \.self) { artefact in
                                        SmallBadge(text: artefact)
                                    }
                                }
                            }
                            Text(fullBuilding.description)
                                .font(.custom("NotoSerif-Regular", size: 16))
                                .foregroundColor(.annoBlue)
                            
                            GeometryReader { geometry in
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 20) { // Adjust spacing as needed
                                        Spacer()
                                            .frame(width: 0)
                                        ForEach(fullBuilding.imageLinks) { imageLink in
                                            NavigationLink(destination:
                                                            ImagePage(image: imageLink)
                                                .navigationBarBackButtonHidden(true)
                                                           
                                            ) {
                                                AnnoImageView(imageLink: imageLink.url, maxWidth: 260, maxHeigth: 260, contentDescription: imageLink.source, cornerRadius: 5)
                                                    .frame(width: 260, height: 260) // Set the fixed width and height for each image
                                            }
                                        }
                                        Spacer()
                                            .frame(width: 0)
                                    }
                                }
                                .frame(minWidth: geometry.size.width+40)
                                .offset(x: -20)
                                
                                
                            }
                            Spacer()
                                .frame(height: 260)
                            
                            Text("Timeline".uppercased())
                                .font(.custom("Oswald-Regular", size: 22))
                                .foregroundColor(.annoBlue)
                            
                            ForEach(fullBuilding.timeline) { timelineElement in
                                TimelineRow(year: "\(timelineElement.year)", text: timelineElement.text)
                            }
                            
                        case .failure(let error):
                            Text("Error: \(error.localizedDescription)")
                            
                        default:
                            VStack {
                                HStack {
                                    SmallBadge(text: "placeholder-copy-")
                                    
                                    SmallBadge(text: "placeholder-copy-")
                                    
                                }
                                Text("lassing-ist-die-beste-stadt-der-welt-ich-liebe-meine-steiermark")
                                HStack(spacing: 20) {
                                    ProgressView()
                                        .foregroundColor(.gray)
                                        .frame(width: 260, height: 260)
                                    //ProgressView()
                                    //  .frame(width: 260, height: 260)
                                    
                                }
                            }
                            
                            .redacted(reason: .placeholder)
                        }
                    }
                    
                    .padding(.horizontal, 20)
                    .offset(y: -46)
                }
                //.padding(.top, 40)
            }
            .background(Color.clear)
            .toolbar {
                /* ToolbarItem(placement: .navigationBarLeading) {
                 TopNavWithBackBtn()
                 }
                 */
            }
            .toolbarBackground(
                Color.white,
                for: .navigationBar) //TODO fix this is not working // hours wasted: 2h
            .onAppear {
                detailsStore.reload(buildingId: slimBuilding.id)
            }
            
            TopNavWithBackBtn()
                .frame(width: 115)
                .padding()
        }
    }
}

#Preview {
    DetailsPage(slimBuilding: LocalBuilding.demoBuildingData().first!)
        .environmentObject(DetailsStore(buildings: .none))
}
