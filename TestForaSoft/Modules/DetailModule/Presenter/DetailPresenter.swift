//
//  DetailPresenter.swift
//  TestForaSoft
//
//  Created by Максим Вечирко on 25.01.2021.
//

import Foundation

class DetailPresenter {
    weak var presenterDelegate: PresenterDelagate?
    var album: Album
    var songs: [Song] = []
    var requestFactory: RequestFactory
    
    init(album: Album, requestFactory: RequestFactory) {
        self.album = album
        self.requestFactory = requestFactory
    }
    
    func fetchSong(id: Int) {
        let request = requestFactory.fetchSong()
        let requestModel = SongRequestModel(id: id)
        request.fetch(requestModel: requestModel) { [weak self] (result) in
            guard let self = self else {return}
            switch result.result {
            case .success(let response):
                let songs = response.song
                self.songs = songs
                self.presenterDelegate?.success()
            case .failure(let error):
                self.presenterDelegate?.failure()
                print(error.errorDescription as Any)
            }
        }
    }
}
