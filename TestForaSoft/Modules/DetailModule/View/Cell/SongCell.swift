//
//  SongCell.swift
//  TestForaSoft
//
//  Created by Максим Вечирко on 25.01.2021.
//

import UIKit

class SongCell: UITableViewCell {
    
    @IBOutlet weak var songNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configurateCell(model: [Song]?, indexPath: IndexPath) {
        guard let model = model else {return}
        self.songNameLabel.text = model[indexPath.row].trackName
    }

}
