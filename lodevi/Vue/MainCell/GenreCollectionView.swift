//
//  GenreCollectionView.swift
//  lodevi
//
//  Created by apple on 24/10/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class GenreCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource{
    
    override func awakeFromNib() {
        self.dataSource = self
        self.delegate = self
        let nib = UINib(nibName: "GenreCell", bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: "GenreCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GenreCell", for: indexPath) as? GenreCell
        return cell!
    }
    
    
    


}
