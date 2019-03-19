//
//  AudioViewCell.swift
//  lodevi
//
//  Created by apple on 23/02/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class AudioViewCell: UICollectionViewCell {
    
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var imageArtist: UIImageView!
    @IBOutlet weak var songTitle: UILabel!
    func setupUI(audio: Audio){
        artistName.text = audio.artistName
        songTitle.text = audio.title
        guard let URL = URL(string: audio.thumbnail) else{return}
        let data = NSData(contentsOf: (URL as URL) as URL)
        if data != nil{
            imageArtist.image = UIImage(data: data! as Data)
        }else{
            imageArtist.image = UIImage(named: "profile")
        }
        
    }
}
