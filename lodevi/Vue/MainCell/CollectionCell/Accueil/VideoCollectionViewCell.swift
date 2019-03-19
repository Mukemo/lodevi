//
//  VideoCollectionViewCell.swift
//  lodevi
//
//  Created by apple on 12/03/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class VideoCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var videoImageCover: UIImageView!
    
    @IBOutlet weak var videoTitle: UILabel!
    
    @IBOutlet weak var artistName: UILabel!
    func configureUI(video:Video){
       videoTitle.text = video.title
       artistName.text = video.artistName
        
        guard let URL = URL(string: video.thumbnail ) else{return}
        
        let data = NSData(contentsOf: (URL as URL) as URL)
        if data != nil{
            videoImageCover.image = UIImage(data: data! as Data)
        }else{
            videoImageCover.image = UIImage(named: "music_audio")
        }
    }
}
