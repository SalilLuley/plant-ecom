//
//  FiltersCollectionViewCellDataSource.swift
//  plant_marketplace
//
//  Created by Salil Luley on 01/01/2024.
//

import Foundation
import UIKit

class FiltersCollectionViewCellDataSource : NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    let titles = [ "Plants", "Flowers", "Cacti", "Herbs", "Roses", "Jasmine", "Herman", "Roses", "Jasmine", "Herman"]

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: FiltersCollectionViewCell.reuseIdentifier, for: indexPath) as? FiltersCollectionViewCell else {return UICollectionViewCell()}
        cell.btnFilter.tag = indexPath.row
        cell.setupUI(title: titles[indexPath.row], index: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = titles[indexPath.row].size(withAttributes : nil)
        return CGSize.init(width: (size.width + 50), height: collectionView.frame.size.height)
    }
    
}
