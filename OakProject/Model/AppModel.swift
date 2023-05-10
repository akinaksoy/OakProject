//
//  AppModel.swift
//  OakProject
//
//  Created by Akın Aksoy on 10.05.2023.
//

import Foundation

struct AppModel: Codable {
    let packageName, name: String
    let iconURL: String
    let price: String
    let ratingValue: Double
    let ratingCount: Int
    let downloads: String
    let publishDate: PublishDate
    let version: String
    let category: Category
    let developerName, developerEmail: String
    let developerAddress: String?

    enum CodingKeys: String, CodingKey {
        case packageName, name
        case iconURL = "iconUrl"
        case price, ratingValue, ratingCount, downloads, publishDate, version, category, developerName, developerEmail, developerAddress
    }
}

enum Category: String, Codable {
    case librariesAndDemo = "LIBRARIES_AND_DEMO"
    case lifestyle = "LIFESTYLE"
    case personalization = "PERSONALIZATION"
    case productivity = "PRODUCTIVITY"
    case tools = "TOOLS"
    case travelAndLocal = "TRAVEL_AND_LOCAL"
}

// MARK: - PublishDate
struct PublishDate: Codable {
    let year, month, day: Int
}
