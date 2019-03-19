//
//  AlbumCollectionViewCell.swift
//  lodevi
//
//  Created by apple on 12/03/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class AlbumCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var albumCover: UIImageView!
    @IBOutlet weak var albumTitleLabel: UILabel!
    @IBOutlet weak var artistName: UILabel!
    func configureUI(collection: Collection){
        artistName.text = collection.artistName
        albumTitleLabel.text = collection.name
        guard let URL = URL(string: collection.imagThumb) else{return}
        
        let data = NSData(contentsOf: (URL as URL) as URL)
        if data != nil{
            albumCover.image = UIImage(data: data! as Data)
        }else{
            albumCover.image = UIImage(named: "music_audio")
        }
    }
}
