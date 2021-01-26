//
//  Album.swift
//  TestForaSoft
//
//  Created by Максим Вечирко on 24.01.2021.
//

import Foundation

struct Album: Codable {
    
    var collectionType: String
    var artistName: String
    var collectionName: String
    var collectionId: Int
    var artworkUrl100: String?
    var collectionPrice: Double
    var trackCount: Int
    var copyright: String
    var country: String
    var currency: String
    var releaseDate: String
    var primaryGenreName: String
    
}
