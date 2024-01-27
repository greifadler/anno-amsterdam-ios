//
//  Building+Extension.swift
//  ios-app
//
//  Created by hohe on 27.11.23.

import Foundation

extension ApiBuildingSlim {
    
    func mapAnnoBuildingToLocal() -> LocalBuilding {
        let annoBuilding = self
        let localMainImage = LocalImage(
            url: annoBuilding.previewImageURL ?? "",
            source: annoBuilding.previewImageURL ?? "",
            year: -1
        )
        
        return LocalBuilding(
            id: annoBuilding.id ?? "",
            name: annoBuilding.address ?? "",
            year: annoBuilding.constructionYear ?? 0,
            typeOfUse: annoBuilding.typeOfUse ?? "",
            artefacts:  [],
            description: "",
            mainImageLink: localMainImage,
            imageLinks: [],
            timeline: [],
            latitude: annoBuilding.location?.coordinates?[1] ?? 0.0,
            longitude: annoBuilding.location?.coordinates?[0] ?? 0.0,
            distance: annoBuilding.distance ?? -1
            
        )
    }
    
    
}

