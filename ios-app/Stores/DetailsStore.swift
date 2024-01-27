//
//  AnnoStore.swift
//  ios-app
//
//  Created by hohe on 27.11.23.
//

import Foundation
import CoreLocation


@MainActor
class DetailsStore: ObservableObject {
    
    @Published var building: Result<LocalBuilding, Error>?
    
    @Published var isLoading = false
    
    init(buildings: Result<LocalBuilding, Error>? = nil /*buildingId: String*/) {
        self.building = building
        //Task { await fetchDetails(for: buildingId) }

    }

    
    func reload(buildingId: String) {
        Task { await fetchDetails(for: buildingId) }
    }

    
}



private extension DetailsStore {
    
    func fetchDetails(for buildingId: String) async {
        do {
            if(isLoading) {
                return
            }
            
            isLoading = true
            self.building = .none
                
                let urlTemplate = "\(Constants.baseURL)/buildings/{id}"
                            let finalUrl = urlTemplate.replacingOccurrences(of: "{id}", with: "\(buildingId)")
            print(finalUrl)

                guard let url = URL(string: finalUrl) else {
                    throw ApiError.general
            }
            let urlRequest = URLRequest(url: url, timeoutInterval: 5.0)
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            print(data)
            let buildingResponse = try JSONDecoder().decode(ApiBuilding.self, from: data)
            let building: LocalBuilding = buildingResponse.mapAnnoBuildingToLocal()
    
            self.building = .success(building)
            isLoading = false
            print(self.building)
            
        } catch {
            print("something went wrong: \(error)")
            self.building = .failure(error)
            isLoading = false
        }
    }
}




