//
//  AnnoStore.swift
//  ios-app
//
//  Created by hohe on 27.11.23.
//

import Foundation
import CoreLocation


@MainActor
class AnnoStore: ObservableObject {
    
    @Published var buildings: Result<[LocalBuilding], Error>?
    
    @Published var isLoading = false
    @Published private var offsetVal = 0
    
    @Published var latitude: Double?
        @Published var longitude: Double?
    
    @Published var locationManager: NewLocationManager? = nil
    
    @Published var searchTerm: String = "" {
        didSet {
            print("searchTerm is now set to \(searchTerm)")
            if(!searchTerm.isEmpty) {
                //filterCentury = -1 //cause our api cannot handle this ... we need to reset the val for the century
            }
            Task { await setup() }
        }
    }
    
    
    @Published var filterCentury: Int = -1 {
        didSet {
            if(filterCentury != -1) {
                //searchTerm = "" //cause our api cannot handle this ... we need to reset the val for the searchTerm
            }
            print("filterCentury is now set to \(filterCentury)")
            Task { await setup() }
        }
    }
    
    
    
    init(buildings: Result<[LocalBuilding], Error>? = nil) {
        self.buildings = buildings
        Task { await setup() }

    }

    
    func reload() {
        Task { await setup() }
    }
    
    func loadMoreContentIfNeeded(currentItem item: ApiBuildingSlim) {
        
        switch buildings {
        case .success(let pokemonList):
            
            let thresholdIndex = pokemonList.index(pokemonList.endIndex, offsetBy: -5)
            if pokemonList.firstIndex(where: { $0.id == item.id }) == thresholdIndex {
                //Task { await loadMoreContent() }
            }
            
        case .failure:
            Task { await setup() }
        case nil:
            Task { await setup() }
        }
    }
}



private extension AnnoStore {
    
    func setup() async {
        do {
            isLoading = true
            self.buildings = .none
            offsetVal = 0
            
            var urlBuilder: String = "\(Constants.baseURL)/buildings/slim?"
            
            if (locationManager?.location != nil) {
                urlBuilder += "lat=\(locationManager!.location!.coordinate.latitude)&lon=\(locationManager!.location!.coordinate.longitude)&"
            }
            
            if(filterCentury != -1) {
                urlBuilder += "century=\(filterCentury)&"
            }
            
            if(!searchTerm.isEmpty) {
                urlBuilder += "address_or_name=\(searchTerm)&"

                // urlBuilder = "\(Constants.baseURL)/buildings/search?address=\(searchTerm)"
            }
                
            guard let url = URL(string: urlBuilder) else {
                    throw ApiError.general
            }
                                
            print(url)
                                
            let urlRequest = URLRequest(url: url, timeoutInterval: 5.0)
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            print(data)
            let buildingResponse = try JSONDecoder().decode([ApiBuildingSlim].self, from: data)
            let buildings: [LocalBuilding] = buildingResponse
                .map{ it in
                    it.mapAnnoBuildingToLocal()
                }
    
            self.buildings = .success(buildings)
            isLoading = false
            
        } catch {
            print("something went wrong: \(error)")
            buildings = .failure(error)
            //buildings = .success(LocalBuilding.demoBuildingData())
            isLoading = false
        }
    }
}




