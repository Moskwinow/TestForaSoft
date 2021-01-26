//
//  AlbumRequestFactory.swift
//  TestForaSoft
//
//  Created by Максим Вечирко on 24.01.2021.
//

import Alamofire

protocol AlbumRequestFactory {
    func fetch(requestModel: RequestModel, completionHandler: @escaping(AFDataResponse<ResponseModel>) -> ())
}
