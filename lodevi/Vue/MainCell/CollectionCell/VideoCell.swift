//
//  VideoCell.swift
//  lodevi
//
//  Created by apple on 03/03/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class VideoCell: UICollectionViewCell {
    
    @IBOutlet weak var albumCoverImage: UIImageView!
    func setupUI(video: Video){
        //self.albumCoverImag
        guard let URL = URL(string: video.title) else{return}
        
        let data = NSData(contentsOf: (URL as URL) as URL)
        if data != nil{
            albumCoverImage.image = UIImage(data: data! as Data)
        }else{
            albumCoverImage.image = UIImage(named: "music_audio")
        }
        //albumCoverImage.image = UIImage(named: "\()")
    }
}
