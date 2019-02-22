//
//  ScrollViewCell.swift
//  lodevi
//
//  Created by apple on 26/10/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class ScrollViewCell: UITableViewCell, UIScrollViewDelegate, TAPageControlDelegate{
    var index = 0
    @IBOutlet weak var scrollView: UIScrollView!
    var timer = Timer()
    var cutomPageControl = TAPageControl()
    var images:[String] = ["img1","img2","img3"]
    //override var contentView: UIView?
    override func awakeFromNib() {
        super.awakeFromNib()
        //scrollView.resizeScrollViewContentSize()
        scrollView.frame = self.frame
        cutomPageControl.numberOfPages = images.count
        for index1 in 0..<images.count {
            print(index)
            let xPos = scrollView.frame.size.width * CGFloat(index1)
            let imageView = UIImageView(frame: CGRect(x: xPos, y: 0, width: self.frame.size.width, height: self.frame.size.height))
            print(self.frame.size.width)
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.image = UIImage(named: self.images[index1])
            //imageView.sizeToFit()
            scrollView.addSubview(imageView)
        }
        print("scroll view : \(scrollView.frame.size.width)")
        scrollView.contentSize = CGSize(width: ((self.frame.size.width) * CGFloat(images.count)), height: (scrollView.frame.size.height))
        index = 0
        scrollView.delegate = self
        cutomPageControl = TAPageControl(frame: CGRect(x: 20, y: (scrollView.frame.origin.y + scrollView.frame.size.height), width: scrollView.frame.size.width, height: 40))
        cutomPageControl.delegate = self
        cutomPageControl.numberOfPages = self.images.count
        cutomPageControl.dotSize = CGSize(width: 20, height: 20)
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width * CGFloat(self.images.count), height: scrollView.frame.size.height)
          addSubview(self.cutomPageControl)
    }
    override func draw(_ rect: CGRect) {
        var contentSize: CGSize  = scrollView.contentSize;
        contentSize.height = self.frame.size.height;
        scrollView.contentSize = contentSize;
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = scrollView.contentOffset.x / scrollView.frame.size.width
        self.cutomPageControl.currentPage = Int(pageIndex)
        index = Int(pageIndex)
    }
    func taPageControl(_ pageControl: TAPageControl!, didSelectPageAt currentIndex: Int) {
        index = currentIndex
        scrollView.scrollRectToVisible(CGRect(x: scrollView.frame.size.width * CGFloat(currentIndex), y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height), animated: true)
    }
//    override func layoutIfNeeded() {
//
//    }
    override func layoutSubviews() {
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(runImages), userInfo: nil, repeats: true)
    }

    @objc func runImages(){
        self.cutomPageControl.currentPage = index
        if index == self.images.count - 1 {
            index = 0
        }else{
            index = index + 1
        }
        taPageControl(cutomPageControl, didSelectPageAt: index)
    }
    
}


extension UIScrollView {
    
    func resizeScrollViewContentSize() {
        
        var contentRect = CGRect.zero
        
        for view in self.subviews {
            
            contentRect = contentRect.union(view.frame)
            
        }
        
        self.contentSize = contentRect.size
        
    }
    
}
