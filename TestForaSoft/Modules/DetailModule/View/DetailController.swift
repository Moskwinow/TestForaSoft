//
//  DetailController.swift
//  TestForaSoft
//
//  Created by Максим Вечирко on 25.01.2021.
//

import UIKit
import Kingfisher
class DetailController: UITableViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var presenter: DetailPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configurateUI()
    }
    
//    MARK: Private Functions
    
    private func configurateUI() {
        let model = presenter.album
        guard let imageUrl = URL(string: model.artworkUrl100 ?? "") else {return}
        self.imageView.kf.setImage(with: imageUrl)
        presenter.fetchSong(id: model.collectionId)
        presenter.presenterDelegate = self
    }
  
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:  return 1
        case 1:  return presenter.songs.count
        default: return 0
        }
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellID.DetailCell, for: indexPath) as! DetailCell
            cell.configurateCell(model: presenter.album)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellID.SongCell, for: indexPath) as! SongCell
            cell.configurateCell(model: presenter.songs, indexPath: indexPath)
            return cell
            
        default: return UITableViewCell()
        }
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "About Album"
        case 1: return "List of Songs"
        default:
            return ""
        }
    }

}


extension DetailController: PresenterDelagate {
    
    func success() {
        DispatchQueue.main.sync { [weak self] in
            self?.tableView.reloadData()
        }
    }
}
