//
//  SearchCollectionView.swift
//  TestForaSoft
//
//  Created by Максим Вечирко on 23.01.2021.
//

import UIKit

// configurating insets and sizes of composition section

private enum InsetsParams {
    static let itemInset = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
    static let sectionInset = NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 10, trailing: 10)
    
    static let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1))
    
    static let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(250))
}


final class SearchCollectionView: UICollectionView {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.registerCells()
        self.collectionViewLayout = createCompositionLayout()
    }
    
    private func registerCells() {
        let cellNib = UINib(nibName: CellID.SearchCell, bundle: nil)
        
        self.register(cellNib, forCellWithReuseIdentifier: CellID.SearchCell)
    }
    
    private func createCompositionLayout() -> UICollectionViewLayout {
        
        let layout = UICollectionViewCompositionalLayout {
            sectionIndex, layoutEnviroment in
            
            return self.createSearchSection(with: sectionIndex)
        }
        
        return layout
    }
    
    
    private func createSearchSection(with withIndexPath: Int) -> NSCollectionLayoutSection {
        
        let itemSize = InsetsParams.itemSize
        
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = InsetsParams.itemInset
        
        let groupSize = InsetsParams.groupSize
        
        let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [layoutItem])
        
        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        layoutSection.contentInsets = InsetsParams.sectionInset
        
        return layoutSection
    }
}
