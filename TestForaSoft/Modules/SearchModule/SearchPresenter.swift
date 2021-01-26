//
//  SearchPresenter.swift
//  TestForaSoft
//
//  Created by Максим Вечирко on 23.01.2021.
//

import Foundation

protocol PresenterDelagate: class {
    func success()
    func failure()
}

extension PresenterDelagate {
    func failure() {
        print("something went wrong")
    }
}

class SearchPresenter {
    
    weak var searchPresenterDelegate: PresenterDelagate?
    lazy var coreManager = CoreManager.instance
    let requestFactory = RequestFactory()
    
    var model: [Album?] = []
    
    
    func request(searchText: String) {
        
        let request = requestFactory.fetchAlbums()
        let requestModel = RequestModel(term: searchText)
        
        request.fetch(requestModel: requestModel) {[unowned self] (result) in
            switch result.result {
            case .success(let responseModel):
                let sortedModel = responseModel.albums.sorted(by: {$0?.collectionName ?? "" < $1?.collectionName ?? ""})
                self.model = sortedModel
                self.searchPresenterDelegate?.success()
                
            case .failure(let error):
                print(error.errorDescription  as Any)
                self.searchPresenterDelegate?.failure()
            }
        }
    }
}

extension SearchPresenter {
    
    func saveSearchText(searchText: String) {
        let history = History(context: coreManager.context)
        history.searchedText = searchText
        coreManager.save()
    }
    
}

