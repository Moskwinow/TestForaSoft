//
//  RequestFactory.swift
//  Shop
//
//  Created by Максим Вечирко on 20.12.2020.
//  Copyright © 2020 Максим Вечирко. All rights reserved.
//

import Alamofire

class RequestFactory {
    
    func makeErrorParser() -> AbstractErrorParser {
        ErrorParser()
    }
    
    lazy var commonSession: Session = {
        let config = URLSessionConfiguration.default
        config.httpShouldSetCookies = false
        config.headers = .default
        let manager = Session(configuration: config)
        return manager
    }()
    
    let sessionQueue = DispatchQueue.global(qos: .utility)
    
    func fetchAlbums() -> AlbumRequestFactory {
        let errorParser = makeErrorParser()
        return GetAlbums(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func fetchSong() -> SongRequestFactory {
        let errorParser = makeErrorParser()
        return GetSong(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
}
