//
//  ArtistViewCell.swift
//  lodevi
//
//  Created by apple on 24/02/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class ArtistViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageArtists: UIImageView!
    
    @IBOutlet weak var artistNameLabel: UILabel!
    func updateUI(artist: Artist){
        guard let URL = URL(string: artist.thumbnail) else{return}
        let data = NSData(contentsOf: (URL as URL) as URL)
        if data != nil{
            imageArtists.image = UIImage(data: data! as Data)
        }else{
            imageArtists.image = UIImage(named: "profile")
        }
        artistNameLabel.text = artist.name
    }
}
