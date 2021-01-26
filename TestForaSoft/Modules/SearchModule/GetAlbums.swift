//
//  GetAlbums.swift
//  TestForaSoft
//
//  Created by Максим Вечирко on 24.01.2021.
//

import Alamofire

// extend abstract factory

class GetAlbums: AbstractRequestFactory {
    
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

// extend own request factory in extension

extension GetAlbums: AlbumRequestFactory {
    func fetch(requestModel: RequestModel, completionHandler: @escaping (AFDataResponse<ResponseModel>) -> ()) {
        
        let request = ModelRequest(baseUrl: baseUrl, requestModel: requestModel)
        self.request(request: request, completionHandler: completionHandler)
    }
}


// creating request model in extension

extension GetAlbums {
    struct ModelRequest: RequestRouter {
        
        var baseUrl: URL
        
        var method: HTTPMethod = .get
        
        var path: String {
            return "/search"
        }
        
        var requestModel: RequestModel
        
        var parameters: Parameters? {
            return [
                "term": requestModel.term,
                "entity": requestModel.entity
            ]
        }
        
        
    }
    
}
