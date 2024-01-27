//
//  LocalBuilding+Extension.swift
//  ios-app
//
//  Created by ANNOAMSTERDAM on 19/12/2023.
//

import Foundation
import MapKit

extension LocalBuilding {
    
    
    func getMapCoordinates() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude ?? 0, longitude: longitude ?? 0)
    }
    
    
    static func demoBuildingData() -> [LocalBuilding] {
        return [
            LocalBuilding(
                id: "1",
                name: "Rijksmuseum",
                year: 1800,
                typeOfUse: "Museum",
                artefacts: ["The Night Watch", "The Milkmaid", "Sick", "Gschissen", "Woke", "Goofy", "Oasch"],
                description: "This house is called De Dolphijn. It is one of three examples in Amsterdam of an early 17th century house with side house (the predecessor of the double house). The second resident, Frans Banninck Cocq, was a lieutenant of the militia in 1635 and in that capacity he was immortalized by Rembrandt in 1642 in the 'Night Watch'.",
                mainImageLink: LocalImage(
                    url: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/96/Rijksmuseum_Amsterdam_ca_1895_rotated.jpg/1200px-Rijksmuseum_Amsterdam_ca_1895_rotated.jpg",
                    source: "Source",
                    year: 2023
                ),
                imageLinks: [
                    LocalImage(
                        url: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/96/Rijksmuseum_Amsterdam_ca_1895_rotated.jpg/1200px-Rijksmuseum_Amsterdam_ca_1895_rotated.jpg",
                        source: "Source",
                        year: 2023
                    ),
                    LocalImage(
                        url: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/96/Rijksmuseum_Amsterdam_ca_1895_rotated.jpg/1200px-Rijksmuseum_Amsterdam_ca_1895_rotated.jpg",
                        source: "Source",
                        year: 2023
                    ),
                    LocalImage(
                        url: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/96/Rijksmuseum_Amsterdam_ca_1895_rotated.jpg/1200px-Rijksmuseum_Amsterdam_ca_1895_rotated.jpg",
                        source: "Source",
                        year: 2023
                    )
                ],
                timeline: [
                    LocalTimeline(year: 1800, text: "Renovation started"),
                    LocalTimeline(year: 1885, text: "Officially opened")
                ],
                latitude: 52.359794,
                longitude: 4.885691,
                distance: 5.3
            ),
            LocalBuilding(
                id: "2",
                name: "Anne Frank House",
                year: 1800,
                typeOfUse: "Historical Site",
                artefacts: ["Diary of Anne Frank", "Historical documents"],
                description: "A museum dedicated to the Jewish wartime diarist Anne Frank.",
                mainImageLink: LocalImage(
                    url: "PLACEHOLDER_URL_ANNE_FRANK_HOUSE_MAIN",
                    source: "Source",
                    year: 2023
                ),
                imageLinks: [
                    LocalImage(
                        url: "PLACEHOLDER_URL_ANNE_FRANK_HOUSE_1",
                        source: "Source",
                        year: 2023
                    )
                ],
                timeline: [
                    LocalTimeline(year: 1942, text: "Anne Frank went into hiding"),
                    LocalTimeline(year: 1960, text: "Museum opened")
                ],
                latitude: 52.37522,
                longitude: 4.88395,
                distance: 15
            ),
            // Van Gogh Museum
            LocalBuilding(
                id: "3",
                name: "Van Gogh Museum",
                year: 1800,
                typeOfUse: "Museum",
                artefacts: ["Sunflowers", "The Starry Night"],
                description: "A museum dedicated to the works of Vincent van Gogh.",
                mainImageLink: LocalImage(
                    url: "PLACEHOLDER_URL_VAN_GOGH_MUSEUM_MAIN",
                    source: "Source",
                    year: 2023
                ),
                imageLinks: [
                    LocalImage(
                        url: "PLACEHOLDER_URL_VAN_GOGH_MUSEUM_1",
                        source: "Source",
                        year: 2023
                    )
                ],
                timeline: [
                    LocalTimeline(year: 1973, text: "Museum opened")
                ],
                latitude: 52.35807,
                longitude: 4.88121,
                distance: 500
            ),
            // Stedelijk Museum
            LocalBuilding(
                id: "4",
                name: "Stedelijk Museum",
                year: 1800,
                typeOfUse: "Museum",
                artefacts: ["Contemporary Art", "Design"],
                description: "A museum for modern art, contemporary art, and design.",
                mainImageLink: LocalImage(
                    url: "PLACEHOLDER_URL_STEDELIJK_MUSEUM_MAIN",
                    source: "Source",
                    year: 2023
                ),
                imageLinks: [
                    LocalImage(
                        url: "PLACEHOLDER_URL_STEDELIJK_MUSEUM_1",
                        source: "Source",
                        year: 2023
                    )
                ],
                timeline: [
                    LocalTimeline(year: 1895, text: "Museum opened")
                ],
                latitude: 52.35807,
                longitude: 4.87986,
                distance: 30.999
            ),
            // Hermitage Amsterdam
            LocalBuilding(
                id: "5",
                name: "Hermitage Amsterdam",
                year: 1800,
                typeOfUse: "Museum",
                artefacts: ["Russian art", "Cultural exhibitions"],
                description: "A branch museum of the Hermitage Museum of Saint Petersburg.",
                mainImageLink: LocalImage(
                    url: "PLACEHOLDER_URL_HERMITAGE_AMSTERDAM_MAIN",
                    source: "Source",
                    year: 2023
                ),
                imageLinks: [
                    LocalImage(
                        url: "PLACEHOLDER_URL_HERMITAGE_AMSTERDAM_1",
                        source: "Source",
                        year: 2023
                    )
                ],
                timeline: [
                    LocalTimeline(year: 2009, text: "Opened as Hermitage Amsterdam")
                ],
                latitude: 52.36532,
                longitude: 4.90231,
                distance: 5.34
            )        ]
    }
}

