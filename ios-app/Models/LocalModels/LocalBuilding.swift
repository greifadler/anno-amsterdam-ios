//
//  LocalBuilding.swift
//  ios-app
//
//  Created by ANNOAMSTERDAM on 19/12/2023.
//

import Foundation

class LocalBuilding: Identifiable {
    var id: String
    var name: String
    var year: Int
    var typeOfUse: String
    var artefacts: [String]
    var description: String
    var mainImageLink: LocalImage
    var imageLinks: [LocalImage]
    var timeline: [LocalTimeline]
    var latitude: Double
    var longitude: Double
    var distance: Double

    init(id: String, name: String, year: Int, typeOfUse: String, artefacts: [String], description: String, mainImageLink: LocalImage, imageLinks: [LocalImage], timeline: [LocalTimeline], latitude: Double, longitude: Double, distance: Double) {
        self.id = id
        self.name = name
        self.year = year
        self.typeOfUse = typeOfUse
        self.artefacts = artefacts
        self.description = description
        self.mainImageLink = mainImageLink
        self.imageLinks = imageLinks
        self.timeline = timeline
        self.latitude = latitude
        self.longitude = longitude
        self.distance = distance
    }
}

// Usage example:
let building = LocalBuilding(
    id: "1",
    name: "Rijksmuseum",
    year: 1800,
    typeOfUse: "Museum",
    artefacts: ["The Night Watch", "The Milkmaid", "Sick", "Gschissen", "Woke", "Goofy", "Oasch"],
    description: "This house is called De Dolphijn...",
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
        // Add more AnnoImage instances here
    ],
    timeline: [
        LocalTimeline(year: 1800, text: "Renovation started"),
        LocalTimeline(year: 1885, text: "Officially opened")
    ],
    latitude: 52.359794,
    longitude: 4.885691,
    distance: 5.3
)
