//
//  GenreCollectionView.swift
//  lodevi
//
//  Created by apple on 24/10/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class GenreCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource{
    var dataService = DataService.instance
    override func awakeFromNib() {
        self.dataSource = self
        self.delegate = self
        dataService.delegate = self
        dataService.getAllCategories(completion: { Success in if Success { print("wow")} })
    }
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataService.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GenreCell", for: indexPath) as? GenreCell
        cell?.setupUI(category: dataService.categories[indexPath.row])
        return cell!
    }
}

extension GenreCollectionView:DataServiceDelegate{
    func musicByCategoryLoaded() {
        
    }
    
    func artistLoaded() {
        
    }
    
    func categoryLoaded() {
        print("Inside categorie ************************************************************")
        print(dataService.getAllAudios(completion: { Success in if Success { print("wow")} }))
        print(dataService.audios)
        print("Outside categorie *********************************************")
        OperationQueue.main.addOperation {
             self.reloadData()
        }
    }
    
    func collectionLoaded() {
        
    }
    
    func audioLoaded() {
        
    }
    
    func videoLoaded() {
        
    }
    
    
}
