//
//  ListMusicTableViewCell.swift
//  lodevi
//
//  Created by apple on 14/03/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class ListMusicTableViewCell: UITableViewCell {

    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var musicTitle: UILabel!
    @IBOutlet weak var coverImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(audio: Audio){
        artistName.text = audio.artistName
        musicTitle.text = audio.title
        
        //configuring the coverImage
        guard let URL = URL(string: audio.thumbnail) else{return}
        print("Mon url pour le thumbnail \(audio.thumbnail)")
        let data = NSData(contentsOf: (URL as URL) as URL)
        if data != nil{
            coverImage.image = UIImage(data: data! as Data)
        }else{
            coverImage.image = UIImage(named: "profile")
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
