//
//  AppleMapPage.swift
//  ios-app
//
//  Created by ANNOAMSTERDAM on 29/12/2023.
//

import SwiftUI
import MapKit


 /*
 struct MapPage: View {
 
 @EnvironmentObject
 var annoStore: AnnoStore
 
 @State private var selectedBuilding: LocalBuilding?
 
 
 @State var region = MKCoordinateRegion(
 center: .init(latitude: 37.334_900,longitude: -122.009_020),
 span: .init(latitudeDelta: 0.2, longitudeDelta: 0.2)
 )
 
 var body: some View {
 Map(coordinateRegion: .constant(region), showsUserLocation: true, userTrackingMode: .constant(.follow), annotationItems: annoStore.buildings) { building in
 MapPin(coordinate: CLLocationCoordinate2D(latitude: building.latitude, longitude: building.longitude), tint: .blue)
 .onTapGesture {
 selectedBuilding = building
 }
 }
 .alert(item: $selectedBuilding) { building in
 Alert(
 title: Text(building.name),
 message: Text("Year: \(building.year)\nType of Use: \(building.typeOfUse)"),
 dismissButton: .default(Text("OK")) {
 selectedBuilding = nil
 }
 )
 }
 }
 
 }*/

struct AppleMapPage: View {
    
    @EnvironmentObject
    var annoStore: AnnoStore
    
    @State var selectedBuilding: LocalBuilding?
    
    
    @State var region = MKCoordinateRegion(
        center: .init(latitude: 37.334_900,longitude: -122.009_020),
        span: .init(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    
    var body: some View {
        ZStack {
            
            switch annoStore.buildings {
            case .success(let buildingArray):
                
                Map(
                    
                ) {
                    ForEach(buildingArray, id: \.id) { building in
                        
                        Annotation(building.name, coordinate: building.getMapCoordinates()) {
                            //if(building.id == selectedBuilding.id ?? -1) {
                            /*
                             NavigationLink(destination:
                             DetailsPage(slimBuilding: building)
                             .environmentObject(DetailsStore())
                             .navigationBarBackButtonHidden(true)
                             
                             
                             
                             ) {
                             ZStack {
                             BuildingPreviewCard(name: building.name, year: building.year, distance: "\(building.distance) m", typeOfUse: building.typeOfUse, onExit: {})
                             
                             }
                             }
                             
                             } else {*/
                            
                            ZStack {
                                AnnoMarker(year: building.year)
                                    .padding()
                                
                            }
                            .onTapGesture {
                                selectedBuilding = building
                                print("lololo")
                            }
                            //}
                            
                            
                        }
                        /*  } else {
                         Marker(coordinate: building.getMapCoordinates(), label: building.name)
                         }*/
                        
                    }
                }
                
                /* .alert(item: $selectedBuilding) { building in
                 Alert(
                 title: Text(building.name),
                 message: Text("Year: \(building.year)\nType of Use: \(building.typeOfUse)"),
                 dismissButton: .default(Text("OK")) {
                 selectedBuilding = nil
                 }
                 )
                 }*/
                
                .sheet(item: $selectedBuilding) { building in
                    
                    DetailsPage(slimBuilding: building)
                        .environmentObject(DetailsStore())
                        .navigationBarBackButtonHidden(true)
                    
                    /*
                     NavigationLink(destination:
                     DetailsPage(slimBuilding: building)
                     .environmentObject(DetailsStore())
                     .navigationBarBackButtonHidden(true)
                     
                     ) {
                     ZStack {
                     BuildingPreviewCard(name: building.name, year: building.year, distance: "\(building.distance) m", typeOfUse: building.typeOfUse, onExit: { selectedBuilding = nil })
                     
                     }
                     }
                     */
                }
                
            case .failure(let error):
                ErrorView(error: error)
                
            default:
                ProgressView("Loading...")
                //Map().redacted(reason: .placeholder) --> looks ugly
            }
            VStack(alignment: .leading) {                 SearchBar()
                    .frame(height: 40)
                    .padding()
                
                CentuaryFilter()
                    .frame(height: 40)
                Spacer()
            }
            
            
        }
        
        .onAppear {
            // Fetch building data here using annoStore or your data fetching mechanism.
            // For example, you can call a function to fetch data from an API.
        }
    }
}

#Preview {
    AppleMapPage()
        .environmentObject(AnnoStore())
}
