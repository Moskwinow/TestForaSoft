//
//  HistoryController.swift
//  TestForaSoft
//
//  Created by Максим Вечирко on 25.01.2021.
//

import UIKit

class HistoryController: UITableViewController {
    
    var presenter: HistoryPresenter = HistoryPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configurateTableView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter.reloadModel()
        self.tableView.reloadData()
    
    }
    
    // MARK: - Private Functions

    private func configurateTableView() {
        self.tableView.tableFooterView = UIView(frame: .zero)
    }
    
//    research albums function with performing back to the first view controller
    
    private func prepareForReSearchHistoryText(with indexPath: IndexPath) {
        if let navigation = self.tabBarController?.viewControllers?[0] as? UINavigationController {
            guard let firstView = navigation.viewControllers.first as? SearchController else {return}
            guard let searchText = presenter.model[indexPath.row].searchedText else {return}
            firstView.presenter.request(searchText: searchText)
            self.tabBarController?.selectedIndex = 0
        }
    }
    
    
    // MARK: - Data & Source of table view controller
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Last Search"
    }
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return presenter.model.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellID.HistoryCell, for: indexPath) as! HistoryCell
        cell.configurateCell(model: presenter.model, indexPath: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.prepareForReSearchHistoryText(with: indexPath)
    }

}
