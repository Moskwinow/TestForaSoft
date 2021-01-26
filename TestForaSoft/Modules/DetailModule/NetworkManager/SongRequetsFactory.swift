//
//  SongRequetsFactory.swift
//  TestForaSoft
//
//  Created by Максим Вечирко on 25.01.2021.
//

import Alamofire

protocol SongRequestFactory {
    func fetch(requestModel: SongRequestModel, completionHandler: @escaping(AFDataResponse<SongResponseModel>) -> ())
}
