//
//  DetailCell.swift
//  TestForaSoft
//
//  Created by Максим Вечирко on 25.01.2021.
//

import UIKit

class DetailCell: UITableViewCell {
    
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var albumLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var songsLabel: UILabel!
    @IBOutlet weak var copyrightLabel: UILabel!
    @IBOutlet weak var countyLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var realesedLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configurateCell(model: Album?) {
        guard let model = model else {return}
        self.typeLabel.text = model.collectionType
        self.artistLabel.text = model.artistName
        self.albumLabel.text = model.collectionName
        self.priceLabel.text = "\(model.collectionPrice) $"
        self.songsLabel.text = String(model.trackCount)
        self.copyrightLabel.text = model.copyright
        self.countyLabel.text = model.country
        self.currencyLabel.text = model.currency
        self.realesedLabel.text = performToDate(model.releaseDate)
        self.genreLabel.text = model.primaryGenreName
    }
    
    private func performToDate(_ isoDate: String) -> String {
        let dateFormater = ISO8601DateFormatter()
        guard let date = dateFormater.date(from: isoDate) else {return isoDate}
        let dataFormaterToString = DateFormatter()
        dataFormaterToString.dateFormat = "EEEE, MMM d, yyyy"
        let stringDate = dataFormaterToString.string(from: date)

        return stringDate
    }

}
