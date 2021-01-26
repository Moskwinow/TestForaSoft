//
//  SearchCell.swift
//  TestForaSoft
//
//  Created by Максим Вечирко on 24.01.2021.
//

import UIKit
import Kingfisher

class SearchCell: UICollectionViewCell {
    
    @IBOutlet weak var artworkImage: UIImageView!
    @IBOutlet weak var albumName: UILabel!
    @IBOutlet weak var authorName: UILabel!

    func configurateCell(model: [Album?], indexPath: IndexPath) {
        albumName.text = model[indexPath.row]?.collectionName
        authorName.text = model[indexPath.row]?.artistName
        guard let image = model[indexPath.row]?.artworkUrl100 else {return}
        guard let imageURL = URL(string: image) else {return}
        artworkImage.kf.indicatorType = .activity
        artworkImage.kf.setImage(with: imageURL)
    }

}
