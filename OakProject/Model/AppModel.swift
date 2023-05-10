//
//  AppModel.swift
//  OakProject
//
//  Created by Akın Aksoy on 10.05.2023.
//

import Foundation

struct AppModel: Codable,Identifiable {
    let packageName, name: String
    let iconURL: String
    let price: String
    let ratingValue: Double?
    let ratingCount: Int?
    let downloads: String
    let publishDate: PublishDate
    let version: String
    let category: String
    let developerName, developerEmail: String
    let developerAddress: String?
    let id = UUID()

    enum CodingKeys: String, CodingKey {
        case packageName, name
        case iconURL = "iconUrl"
        case price, ratingValue, ratingCount, downloads, publishDate, version, category, developerName, developerEmail, developerAddress
    }
}

// MARK: - PublishDate
struct PublishDate: Codable {
    let year, month, day: Int
}
