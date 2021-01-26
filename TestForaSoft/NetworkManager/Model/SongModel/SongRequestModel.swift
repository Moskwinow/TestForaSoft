//
//  SongRequestModel.swift
//  TestForaSoft
//
//  Created by Максим Вечирко on 25.01.2021.
//

import Foundation


struct SongRequestModel: Codable {
    var id: Int
    var entity: String {
        return "song"
    }
}
