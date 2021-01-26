//
//  HistoryCell.swift
//  TestForaSoft
//
//  Created by Максим Вечирко on 25.01.2021.
//

import UIKit

class HistoryCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    func configurateCell(model: [History], indexPath: IndexPath) {
        self.textLabel?.text = model[indexPath.row].searchedText
    }

}
