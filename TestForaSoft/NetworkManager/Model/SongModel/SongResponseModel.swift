//
//  SongResponseModel.swift
//  TestForaSoft
//
//  Created by Максим Вечирко on 25.01.2021.
//

import Foundation

struct SongResponseModel: Codable {
    var count: Int
    var song: [Song]

    enum CodingKeys: String, CodingKey {
        case count = "resultCount"
        case song = "results"
    }
}
