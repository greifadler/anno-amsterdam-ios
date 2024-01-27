//
//  AnnoBuilding+Extension.swift
//  ios-app
//
//  Created by ANNOAMSTERDAM on 03/01/2024.
//

import Foundation
//
//  Building+Extension.swift
//  ios-app
//
//  Created by hohe on 27.11.23.

import Foundation

extension ApiBuilding {
    
    func mapAnnoBuildingToLocal() -> LocalBuilding {
        let apiBuilding = self
        let localMainImage = LocalImage(
            url: apiBuilding.previewImageURL ?? "",
            source: apiBuilding.previewImageURL ?? "",
            year: -1
        )
        
        let images: [LocalImage]  = apiBuilding.imageUrls?.compactMap { it in
            guard let url = it.url else {
                return nil // Skip the element with a nil url (if no source is there - it is fine)
            }
            return LocalImage(url: url, source: it.source ?? "", year: -1)
        } ?? []
        
        let timeline: [LocalTimeline] = apiBuilding.timeline?.compactMap { it in
            guard let year = it.year else {
                return nil // Skip the element with a nil year
            }
            guard let description = it.description else {
                return nil // Skip the element with a nil desc
            }
            return LocalTimeline(year: year, text: description)
        } ?? []
        
        return LocalBuilding(
            id: apiBuilding.id ?? "",
            name: apiBuilding.name ?? apiBuilding.address ?? "",
            year: apiBuilding.constructionYear ?? 0,
            typeOfUse: apiBuilding.typeOfUse ?? "",
            artefacts:  apiBuilding.tags ?? [],
            description: apiBuilding.description ?? "",
            mainImageLink: localMainImage,
            imageLinks: images,
            timeline: timeline,
            latitude: apiBuilding.location?.coordinates?[1] ?? 0.0,
            longitude: apiBuilding.location?.coordinates?[0] ?? 0.0,
            distance: 1 //TODO: calaculate distance
            
        )
    }
    
    
}

