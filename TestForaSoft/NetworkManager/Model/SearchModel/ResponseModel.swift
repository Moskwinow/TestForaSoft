//
//  ResponseModel.swift
//  TestForaSoft
//
//  Created by Максим Вечирко on 24.01.2021.
//

import Foundation

struct ResponseModel: Codable {
    
    var count: Int
    var albums: [Album?]

    enum CodingKeys: String, CodingKey {
        case count = "resultCount"
        case albums = "results"
    }
}

