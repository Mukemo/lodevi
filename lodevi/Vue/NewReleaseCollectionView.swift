//
//  NewReleaseCollectionView.swift
//  lodevi
//
//  Created by apple on 26/10/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class NewReleaseCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource{

    override func awakeFromNib() {
        self.dataSource = self
        self.delegate = self
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewReleaseCell", for: indexPath) as! NewReleaseCell
        return cell
    }
    

  
}
