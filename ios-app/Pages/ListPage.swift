//
//  ListPage.swift
//  ios-app
//
//  Created by ANNOAMSTERDAM on 14/12/2023.
//

import Foundation

import SwiftUI

struct BuildingListView: View {
    @EnvironmentObject
    var annoStore: AnnoStore
    
    var body: some View {
        VStack {
            
            SearchBar()
                .frame(height: 40)
                .padding()
            
            CentuaryFilter()
                .frame(height: 40)
            
            List {
                switch annoStore.buildings {
                case .success(let buildingArray):
                    if(buildingArray.count <= 0) {
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                Text("Looks kinda empty?!")
                                    .font(.custom("Oswald", size: 16))
                                    .foregroundColor(Color.annoBlue) // Define this color in your assets
                                    .frame(width: 195, alignment: .center)
                                Spacer()
                            }
                            Spacer()
                            AnimatedIconView(iconSystemName: "tray")
                            Spacer()
                            
                        }
                        .listRowSeparator(.hidden)
                        
                        
                    } else {
                        
                        ForEach(buildingArray, id: \.id) { building in
                            NavigationLink(destination:
                                            DetailsPage(slimBuilding: building)
                                .environmentObject(DetailsStore())
                                .navigationBarBackButtonHidden(true)
                                           
                            ) {
                                ListItem(streetName: building.name, buildingYear: "Anno " + String(building.year), imageLink: building.mainImageLink.url , typeOfUse: building.typeOfUse,
                                         distance: Int( building.distance))
                            }
                            .navigationBarBackButtonHidden(true)
                            Divider()
                                .frame(height: 1)
                                .background(Color("AnnoLight"))
                                .padding(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
                            
                        }
                        .listRowSeparator(.hidden)
                        
                    }
                    
                    
                case .failure(let error):
                    ErrorView(error: error)
                        .listRowSeparator(.hidden)
                    
                default:
                    ForEach(0..<3, id: \.self) { index in
                        
                        ListItem(streetName: "basic anno street", buildingYear: "Anno " + String(2000), imageLink: "testurl" , typeOfUse: "loading type of use",
                                 distance: Int( 100))
                        Divider()
                            .frame(height: 1)
                            .background(Color("AnnoLight"))
                            .padding(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
                    }
                    .redacted(reason: .placeholder)
                    .listRowSeparator(.hidden)
                }
                
            }
            .listStyle(.plain)
            .padding()
            
            
        }
        .onAppear {
            // Fetch building data here using annoStore or your data fetching mechanism.
            // For example, you can call a function to fetch data from an API.
        }
    }
}

#Preview {
    BuildingListView()
        .environmentObject(AnnoStore())
}
