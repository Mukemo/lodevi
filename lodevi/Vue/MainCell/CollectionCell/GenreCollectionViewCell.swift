//
//  GenreCollectionViewCell.swift
//  lodevi
//
//  Created by apple on 09/03/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class GenreCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var genreView: UIView!
    
    @IBOutlet weak var genderLabel: UILabel!
    func configureCell(category: Category){
        genderLabel.text = category.name
    }
}
