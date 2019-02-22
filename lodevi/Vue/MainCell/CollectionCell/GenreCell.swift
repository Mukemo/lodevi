//
//  GenreCell.swift
//  lodevi
//
//  Created by apple on 26/10/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class GenreCell: UICollectionViewCell {

    @IBOutlet weak var ImageAlbum: UIImageView!
    
    @IBOutlet weak var titleSong: UILabel!
    
    @IBOutlet weak var singerName: UILabel!
    
    @IBOutlet weak var songPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ImageAlbum.layer.cornerRadius = 20
        ImageAlbum.clipsToBounds = true
        songPrice.layer.cornerRadius = 10
        songPrice.clipsToBounds = true
    }

}
