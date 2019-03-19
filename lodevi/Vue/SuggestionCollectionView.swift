//
//  SuggestionCollectionView.swift
//  lodevi
//
//  Created by apple on 12/03/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class SuggestionCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource{
    override func awakeFromNib() {
        super.awakeFromNib()
        self.delegate = self
        self.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SuggestionCollectionViewCell", for: indexPath) as! SuggestionCollectionViewCell
        return cell
    }
}
