//
//  QuestionModelData.swift
//  PlantAppHubX
//
//  Created by Mehmet Emre on 2.04.2023.
//

import Foundation

struct QuestionModelData: Codable {
    
    let id: Int
    let title, subtitle: String
    let imageURI: String
    let uri: String
    let order: Int

    enum CodingKeys: String, CodingKey {
        case id, title, subtitle
        case imageURI = "image_uri"
        case uri, order
    }
}
