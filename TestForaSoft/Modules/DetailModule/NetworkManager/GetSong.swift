//
//  GetSong.swift
//  TestForaSoft
//
//  Created by Максим Вечирко on 25.01.2021.
//

import Alamofire

class GetSong: AbstractRequestFactory {
    
    var errorParser: AbstractErrorParser
    
    var sessionManager: Session
    
    var queue: DispatchQueue
    
    var baseUrl = URL(string: BaseURL.baseUrl)!
    
    init(errorParser: AbstractErrorParser, sessionManager: Session, queue: DispatchQueue) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
    
}

extension GetSong: SongRequestFactory {
    
    func fetch(requestModel: SongRequestModel, completionHandler: @escaping (AFDataResponse<SongResponseModel>) -> ()) {
        let requestModel = SongRequest(baseUrl: baseUrl, requestModel: requestModel)
        
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
}

extension GetSong {
    struct SongRequest: RequestRouter {
        var baseUrl: URL
        
        var method: HTTPMethod = .get
        
        var path: String {
            return "/lookup"
        }
        
        var requestModel: SongRequestModel
        
        var parameters: Parameters? {
            return [
                "id": requestModel.id,
                "entity": requestModel.entity
            ]
        }
        
        
    }
}
