//
//  AlbumCollectionView.swift
//  lodevi
//
//  Created by apple on 12/03/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class AlbumCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate {
    var dataService = DataService.instance
    override func awakeFromNib() {
        super.awakeFromNib()
        self.delegate = self
        self.dataSource = self
        self.dataService.delegate = self
        self.dataService.getAllCollections(completion: { Success in
            if Success{
                print("it ok")
            }
        })
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataService.collections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlbumCollectionViewCell", for: indexPath) as! AlbumCollectionViewCell
        cell.configureUI(collection: dataService.collections[indexPath.row])
        return cell
    }
    
}
extension AlbumCollectionView: DataServiceDelegate{
    func artistLoaded() {}
    
    func categoryLoaded() {}
    
    func collectionLoaded() {
        OperationQueue.main.addOperation {
            self.reloadData()
        }
    }
    
    func audioLoaded() {}
    
    func videoLoaded() {}
    
    func musicByCategoryLoaded() {}
}
