//
//  GenreCell.swift
//  lodevi
//
//  Created by apple on 26/10/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class GenreCell: UICollectionViewCell {    
    @IBOutlet weak var catgeroyLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func setupUI(category:Category){
        self.catgeroyLabel.text = category.name
    }
}
