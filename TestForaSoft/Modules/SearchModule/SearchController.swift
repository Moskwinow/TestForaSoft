//
//  SearchController.swift
//  TestForaSoft
//
//  Created by Максим Вечирко on 23.01.2021.
//

import UIKit
import Kingfisher

class SearchController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: SearchCollectionView!
    
    var searchController: UISearchController!
    var presenter: SearchPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuratePresenter()
        self.configurateUI()
    }
    
    //    MARK: Private Functions
    
    private func configuratePresenter() {
        self.presenter = SearchPresenter()
        self.presenter.searchPresenterDelegate = self
    }
    
    private func configurateUI() {
        self.configurateCollectionView()
        self.configurateSearchBar()
    }
    
    private func configurateCollectionView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    private func configurateSearchBar() {
        self.searchController = UISearchController()
        self.searchController.searchBar.delegate = self
        self.navigationItem.searchController = searchController
    }
    
    private func configurateAlert() {
        let alert = UIAlertController(title: "Oops", message: "Album not found, try again or enter correct name", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Sad", style: .default, handler: nil)
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    private func preformToDetailController(with indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let presentingView = storyboard.instantiateViewController(withIdentifier: "DetailController") as! DetailController
        presentingView.navigationItem.largeTitleDisplayMode = .never
        guard let album = self.presenter.model[indexPath.row] else {return}
        let presenter = DetailPresenter(album: album, requestFactory: self.presenter.requestFactory)
        presentingView.presenter = presenter
        self.navigationController?.pushViewController(presentingView, animated: true)
    }
    
    
    
    //    MARK: Collection Delegate & DataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return presenter.model.count 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellID.SearchCell, for: indexPath) as! SearchCell
        cell.configurateCell(model: presenter.model, indexPath: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.preformToDetailController(with: indexPath)
    }
    
    
}

// MARK: - Subscribe to protocol for handling updates

extension SearchController: PresenterDelagate {
    
    func success() {
        DispatchQueue.main.async { [unowned self] in
            self.collectionView.reloadData()
            DispatchQueue.main.async { [unowned self] in
                if presenter.model.count <= 0 {
                    self.configurateAlert()
                }
                
            }
        }
    }
    
    func failure() {
        DispatchQueue.main.async { [unowned self] in
            self.configurateAlert()
        }
    }
}

// MARK: - Srearch bar & Search bar controller delegates

extension SearchController: UISearchBarDelegate, UISearchControllerDelegate  {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else {
            return
        }
        
        DispatchQueue.global(qos: .userInitiated).sync { [unowned self] in
            self.presenter.saveSearchText(searchText: searchText)
        }
        
        self.presenter.request(searchText: searchText)
    }
}

