 //
//  AlbumViewCell.swift
//  lodevi
//
//  Created by apple on 24/02/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class AlbumViewCell: UICollectionViewCell {
    @IBOutlet weak var albumCoverImage: UIImageView!
    func updateUI(collection: Collection){
        guard let URL = URL(string: collection.imagThumb) else{return}
        let data = NSData(contentsOf: (URL as URL) as URL)
        if data != nil{
            albumCoverImage.image = UIImage(data: data! as Data)
        }else{
            albumCoverImage.image = UIImage(named: "profile")
        }
    }
}
