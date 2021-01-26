//
//  HistoryPresenter.swift
//  TestForaSoft
//
//  Created by Максим Вечирко on 25.01.2021.
//

import Foundation


class HistoryPresenter {
    var model: [History] = []
    
    func reloadModel() {
        self.model = CoreManager.instance.fetchHistory().reversed()
    }
}
