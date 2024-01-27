//
//  ApiBuilding.swift
//  ios-app
//
//  Created by ANNOAMSTERDAM on 29/12/2023.
//

import Foundation
struct ApiBuildingSlim: Codable {
    let id: String?
    let location: ApiLocationSlim?
    let distance: Double?
    let previewImageURL: String?
    let address: String?
    let constructionYear: Int?
    let typeOfUse: String?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case location, distance
        case previewImageURL = "main_image_url"
        case address
        case constructionYear = "construction_year"
        case typeOfUse = "type_of_use"
    }
}

// MARK: - Location
struct ApiLocationSlim: Codable {
    let type: String?
    let coordinates: [Double]?
}

typealias ApiBuildingsSlim = [ApiBuildingSlim]
