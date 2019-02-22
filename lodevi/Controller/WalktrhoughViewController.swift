//
//  WalktrhoughViewController.swift
//  lodevi
//
//  Created by apple on 24/12/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class WalktrhoughViewController: UIViewController {
    
    //MARK : 1 outlels
    @IBOutlet var headingLabel:UILabel!{
        didSet{
            headingLabel.numberOfLines = 0
        }
    }
    @IBOutlet var subHeadingLabel:UILabel!{
        didSet{
            subHeadingLabel.numberOfLines = 0
        }
    }
    @IBOutlet var contentImageView: UIImageView!
    //MARK : 2 properties
    var index = 0
    var heading = ""
    var subheading = ""
    var imageFile = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        headingLabel.text = heading
        subHeadingLabel.text = subheading
        contentImageView.image = UIImage(named: imageFile)
    }
}
