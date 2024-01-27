// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let aPIBuilding = try? JSONDecoder().decode(APIBuilding.self, from: jsonData)

import Foundation

// MARK: - APIBuilding
struct ApiBuilding: Codable {
    let id: String?
    let location: Location?
    let createdAt, updatedAt: String?
    let previewImageURL: String?
    let address: String?
    let name: String?
    let constructionYear: Int?
    let typeOfUse: String?
    let tags: [String]?
    let description: String?
    let imageUrls: [ImageURL]?
    let timeline: [Timeline]?
    let active: Bool?
    let audioguides: [String]?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case location
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case previewImageURL = "preview_image_url"
        case address
        case name
        case constructionYear = "construction_year"
        case typeOfUse = "type_of_use"
        case tags, description
        case imageUrls = "image_urls"
        case timeline, active, audioguides
    }
}

// MARK: - ImageURL
struct ImageURL: Codable {
    let url: String?
    let source: String?
}

// MARK: - Location
struct Location: Codable {
    let type: String?
    let coordinates: [Double]?
}

// MARK: - Timeline
struct Timeline: Codable {
    let year: Int?
    let description: String?
}
