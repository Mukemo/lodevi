//
//  SliderCell.swift
//  lodevi
//
//  Created by apple on 24/10/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class SliderCell: UITableViewCell, UIScrollViewDelegate {

    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var pageController: UIPageControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageController.currentPage = Int(pageNumber)
    }

}
